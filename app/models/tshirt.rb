class TShirt
  @@itemId = 1
  @@exemplaryIds = (21..40).to_a - [35]
  @@darkExemplaryIds = (21..40).to_a - [21, 22, 28, 31, 32, 35, 39, 40]

  def self.create!(title:, uri:)
    client = Suzuri.connect_oauth(Rails.application.secrets.suzuri_api_token)

    client.material.create(
      texture: uri,
      title: title,
      price: 200,
      products: [
        {
          itemId: @@itemId,
          exemplaryItemVariantId: @@darkExemplaryIds.sample,
          published: true
        }
      ]
    )
  end
end
