#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'
require 'pry'

en_names = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://en.wikipedia.org/wiki/Template:Singapore_Parliament_2016',
  xpath: '//table[contains(@class,"navbox-inner")]//td[contains(@class,"navbox-list")]//ul//li//a[not(@class="new")]/@title',
  debug: true,
).reject { |n| n.end_with? 'Constituency' }
EveryPolitician::Wikidata.scrape_wikidata(names: { en: names })
warn EveryPolitician::Wikidata.notify_rebuilder

