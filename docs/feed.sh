#!/bin/sh

cat << EOF
<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xml:base="https://socialistplanning.org" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd" xmlns:media="http://search.yahoo.com/mrss/">
<channel>
    <title>The Socialist Planning Blog</title>
    <link>https://socialistplanning.org</link>
    <description>Resources for envisioning socialism.</description>
    <language>en</language>
    <generator>Dhall</generator>
    <lastBuildDate>$(date --rfc-email)</lastBuildDate>

    <item>
        <title>Review: People's Republic of Walmart</title>
        <pubDate>$(date --rfc-email -d 2019-09-06T20:00:00-0400)</pubDate>
        <link>https://socialistplanning.org/review-peoples-republic</link>
        <guid>https://socialistplanning.org/review-peoples-republic</guid>
        <dc:creator>Bjorn Westergard</dc:creator>
    </item>

</channel>
</rss>

EOF
    