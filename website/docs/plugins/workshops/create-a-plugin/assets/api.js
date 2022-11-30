const axios = require('axios');
const { Product } = require('./product');

class ProductApiClient {
  constructor(url) {
    this.url = url
  }

  async getProduct(id) {
    return axios.get(`${this.url}/products/${id}`).then(r => new Product(r.data.id, r.data.name, r.data.type));
  }
}
module.exports = {
  ProductApiClient
}