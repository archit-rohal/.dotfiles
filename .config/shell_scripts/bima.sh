#!/bin/bash
mkdir temp_images
after=""
image_count=0
desired_image_count=300

while [ $image_count -lt $desired_image_count ]; do 
  response=$(curl -s -H "User-Agent: my-app" "https://www.reddit.com/r/boobs/.json?after=$after")
  urls=$(echo "$response" | jq -r '.data.children[] | select(.data.url_overridden_by_dest != null) | .data.url_overridden_by_dest' | grep -P 'https?://\S+\.(png|jpg|jpeg|gif)' | grep -v 'i\.imgur\.com')
  
  # Check each URL's HTTP status code before downloading it
  valid_urls=""
  for url in $urls; do
    if curl --output /dev/null --silent --head --fail "$url"; then
      valid_urls="$valid_urls$url"$'\n'
    fi
   
    # Break the loop if we have enough images or if there are no more URLs to check
    if [ $(echo "$valid_urls" | wc -l) -ge $((desired_image_count - image_count)) ] || [ "$url" == "$(echo "$urls" | tail -n1)" ]; then
      break
    fi 
  done
  
  echo "$valid_urls" | xargs -I {} wget -P temp_images {}
  
  image_count=$((image_count + $(echo "$valid_urls" | wc -l)))
  
  after=$(echo "$response" | jq -r '.data.after')
  
  # Break the loop if there are no more pages to load
  if [ "$after" == "null" ]; then
    break
  fi 
done

sxiv temp_images/* 
# && rm -r temp_images
