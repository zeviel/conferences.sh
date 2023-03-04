#!/bin/bash

api="https://conferences-api.smolnik.ru"
sign=null
vk_user_id=null
vk_ts=null
vk_ref=null

function authenticate() {
	# 1 - sign: (string): <sign>
	# 2 - vk_user_id: (integer): <vk_user_id>
	# 3 - vk_ts: (integer): <vk_ts>
	# 4 - vk_ref: (string): <vk_ref>
	# 5 - access_token_settings: (string): <access_token_settings - default: >
	# 6 - are_notifications_enabled: (integer): <are_notifications_enabled: default: 0>
	# 7 - is_app_user: (integer): <is_app_user - default: 0>
	# 8 - is_favorite: (integer): <is_favorite - default: 0>
	# 9 - language: (string): <language - default: ru>
	# 10 - platform: (string): <platform - default: desktop_web>
	sign=$1
	vk_user_id=$2
	vk_ts=$3
	vk_ref=$4
	params="vk_access_token_settings=${5:-}&vk_app_id=8054530&vk_are_notifications_enabled=${6:-0}&vk_is_app_user=${7:-0}&vk_is_favorite=${8:-0}&vk_language=${9:-ru}&vk_platform=${10:-desktop_web}&vk_ref=$vk_ref&vk_ts=$vk_ts&vk_user_id=$vk_user_id&sign=$sign"
	echo $params
}

function get_conferences_rating() {
	curl --request GET \
		--url "$api/rating" \
		--user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36" \
		--header "content-type: application/json" \
		--header "xvk: $params"
}

function get_conference_by_id() {
	# 1 - conference_id: (integer): <conference_id>
	curl --request GET \
		--url "$api/getByID?id=$1" \
		--user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36" \
		--header "content-type: application/json" \
		--header "xvk: $params"
}

function like_conferece() {
	# 1 - conference_id: (integer): <conference_id>
	curl --request GET \
		--url "$api/like?id=$1" \
		--user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36" \
		--header "content-type: application/json" \
		--header "xvk: $params"
}

function get_notifications() {
	curl --request GET \
		--url "$api/getNotifications" \
		--user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36" \
		--header "content-type: application/json" \
		--header "xvk: $params"
}

function get_conferences() {
	curl --request GET \
		--url "$api/getConferences" \
		--user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36" \
		--header "content-type: application/json" \
		--header "xvk: $params"
}


function get_likes() {
	curl --request GET \
		--url "$api/getLikes" \
		--user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36" \
		--header "content-type: application/json" \
		--header "xvk: $params"
}

function add_conference() {
	# 1 - category: (string): <category>
	# 2 - title: (string): <title>
	# 3 - short_description: (string): <short_description>
	# 4 - description: (string): <description>
	# 5 - rules: (string): <rules>
	# 6 - link: (string): <link>
	curl --request GET \
		--url "$api/add?category=$1&title=$2&shortDescription=$3&description=$4&rules=$5&link=$6" \
		--user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36" \
		--header "content-type: application/json" \
		--header "xvk: $params"
}
