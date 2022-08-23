# SP Test Task

## Task

Create script that will:
1. Run with command
`./parser.rb webserver.log`

2. List of webpages with most page views ordered from most pages views to less page views
```
/home 90 visits
/index 80 visits
```
3. List of webpages with most unique page views also ordered:
```
/about/2 8 unique views
/index 5 unique views
```

## Usage

1. Navigate to app folder: `cd ruby_app`
2. Successfully finish `bundle install` to install proper devendencies
3. Run script with `./parser.rb webserver.log`
4. Run testds with `rspec spec/parser_spec.rb`
