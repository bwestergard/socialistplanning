let Post
    : Type
    = { body : Text, shortname : Text, title : Text, date: Text }

let HtmlMap
    : Type
    = { mapKey : Text, mapValue : Text }

let markdownify =
      λ(p : Post) →
        { mapKey = "${p.shortname}.md"
        , mapValue =
            ''
            ---
            title: "${p.title}"
            author: Bjorn Westergard
            include-after: <div id="footer"><hr/><a href="${p.shortname}.pdf">Download PDF</a></div>
            suppress-bibliography: true
            ---

            ${p.body}
            ''
        }

let Prelude = ./prelude-18.0.0.dhall

let Text/concatSep = Prelude.Text.concatSep
let List/map = Prelude.List.map

let posts = [ ./posts/review-peoples-republic.dhall ]

let postFiles = List/map Post HtmlMap markdownify posts

let createFrontpageLink = λ(p : Post) → "- [${p.title}](posts/${p.shortname})"

let indexFile =
      { mapKey = "index.md"
      , mapValue =
          ''
          ---
            pagetitle: "The Socialist Planning Blog"
          ---

          # Posts
          ${Text/concatSep "\n" (List/map Post Text createFrontpageLink posts)}

          You can subscribe to future posts through <a href="./feed.rss">RSS</a> or <a href="https://twitter.com/socplanning">Twitter</a>.

          # About

          How would a socialism achievable in our lifetimes actually work? This blog explores the arguments for and against specific proposals.
          
          Critiques of capitalist social relations lose their force without appeal to some vision of socialist planning. Today, though "socialism" is an increasingly popular ideal, there is no vision of socialist planning that is both widely shared and compelling. This despite the fact that the strongest arguments against the feasibility and desirability of socialist planning are much weaker than is commonly supposed.

          I hope that this blog will play some small part in helping a new generation articulate socialist programs adequate to the grave political and ecological crises of our times.

          # Bookmarks
          - [Viewpoint Magazine](https://www.viewpointmag.com/)
          - [Jacobin Magazine](https://jacobinmag.com/)
          - [Labor Notes](https://www.labornotes.org/)
          - [Organizing Work](https://organizing.work/)
          - [Endnotes](https://endnotes.org.uk/)
          - [People's Policy Project](https://www.peoplespolicyproject.org/)
          - [Science & Society](https://www.scienceandsociety.com/)
          - [The Law and Political Economy Blog](https://lpeproject.org/blog/)
          - [Legal Form](https://legalform.blog/)
          - [Tech Workers Coalition](https://techworkerscoalition.org/)
          - [The Mercatus Center](https://ppe.mercatus.org/)
          ''
      }

let websiteMetaData =
      { baseUri = "https://socialistplanning.org"
      , title = "The Socialist Planning Blog"
      , description = "Resources for envisioning socialism."
      }

let createPostItem =
      λ(p : Post) →
        ''
            <item>
                <title>${p.title}</title>
                <pubDate>$(date --rfc-email -d ${p.date})</pubDate>
                <link>${websiteMetaData.baseUri}/${p.shortname}</link>
                <guid>${websiteMetaData.baseUri}/${p.shortname}</guid>
                <dc:creator>Bjorn Westergard</dc:creator>
            </item>
        ''

let rssFeedGenerationScript =
      { mapKey = "feed.sh"
      , mapValue =
          ''
          #!/bin/sh

          cat << EOF
          <?xml version="1.0" encoding="UTF-8"?>
          <rss version="2.0" xml:base="${websiteMetaData.baseUri}" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd" xmlns:media="http://search.yahoo.com/mrss/">
          <channel>
              <title>${websiteMetaData.title}</title>
              <link>${websiteMetaData.baseUri}</link>
              <description>Resources for envisioning socialism.</description>
              <language>en</language>
              <generator>Dhall</generator>
              <lastBuildDate>$(date --rfc-email)</lastBuildDate>

          ${Text/concatSep "\n" (List/map Post Text createPostItem posts)}
          </channel>
          </rss>

          EOF
              ''
      }

in postFiles # [ indexFile, rssFeedGenerationScript ]
