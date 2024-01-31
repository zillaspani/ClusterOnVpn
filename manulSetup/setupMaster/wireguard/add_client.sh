client_pub_key="J72lmsOdZ8S95W9uAfcMiWkGJom43mkR+jyKMjyOdxA="
client_ip_wg="10.0.0.2/32"

sudo wg set wg0 peer $client_pub_key allowed-ips $client_ip_wg