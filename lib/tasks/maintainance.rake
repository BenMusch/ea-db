require 'csv'

task create_articles_from_csv: :environment do
  csv_file = "#{Rails.root}/articles.csv"

  CSV.foreach(csv_file, headers: true, encoding: "ISO8859-1") do |row|
    row.each do |key, val|
      puts key
      puts row[key]
      row[key] =  row[key] && row[key].present? ? row[key].strip : nil
    end
    authors = row["Author"].gsub(" &", ",").split(",")
    authors.collect! { |name| Author.find_or_create_by(name: name.strip) }

    tags = []
    if row["Tags"]
      tags = row["Tags"].split(",").map { |name| Tag.find_or_create_by(name: name) }
    end

    if row["Category"].present?
      category = Category.find_or_create_by(name: row["Category"])
    else
      category = Category.find_or_create_by(name: "Uncategorized")
    end

    if row["Subcategory"].present?
      subcategory = Subcategory.find_or_create_by(category: category,
                                                  name: row["Subcategory"])
    else
      subcategory = Subcategory.find_or_create_by(name: "Uncategorized",
                                                  category: category)
    end

    if row["Media type"].present?
      media_type = MediaType.find_or_create_by(name: row["Media type"])
    end

    description = row["Description"]
    description = description.present? && description != "*" ? description : nil
    difficulty = row["Difficulty"]
    difficulty = difficulty.present? ? difficulty.to_i : nil
    data = {title: row["Resource title"],
            url: row["URL"],
            category: category,
            subcategory: subcategory,
            description: description,
            media_type: media_type,
            difficulty: difficulty}

    if article = Article.find_by(url: row["URL"])
      article.update_attributes data
    else
      article = Article.new(data)
      article.save
      tags.each { |tag| Tagging.create(article: article, tag: tag) }
      authors.each { |author| Authoring.create(article: article, author: author) }
    end
  end
end
