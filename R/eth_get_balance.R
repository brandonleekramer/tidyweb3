eth_get_balance = function(wallet, provider_url, api_key){
  request_output = request(str_c(provider_url, api_key)) %>%
    req_headers('accept' = "application/json",
                'content-type' = "application/json") %>%
    req_body_raw(str_c('{"id": 1,"jsonrpc": "2.0", "method": "eth_getBalance",
                 "params": ["',wallet,'", "latest"]}')) %>%
    req_perform() %>%
    resp_body_json()
  request_output = as.numeric(request_output$result)/(10^18)
  request_output
}
