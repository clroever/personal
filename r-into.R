1+100
1==2
x <- 1/40
log (x)
x+x
x <- 100
x


y <- c(1, 4.5, 2.7, 9)
z <- 1:5

# Create a vector of animals
animals <- c("monkey", "rabbit", "dog")
animals

# Add 4 to each element in y
y + 4

# Add text to animals
paste("The animal is: ", animals)


# inspect the type of an object
typeof(y)
typeof(animals)
typeof(z)


# Predict what happens when I do this:
new_vector <- c(5, 7.5, "hat")
typeof(new_vector)

# Name can contain letters, numbers, periods, and underscores
# A letter must come first = y2
y2 <- c(1,5,7)
2y <- c(1,5,7)   #Error



# Challenge 2, What is the value of Mass and Age after each operation:
mass <- 47.5
age <- 122
mass <- mass * 2.3
age <- age - 20


# Remove a variable
rm(y2)


# Load data table into R
cats <- read.csv(file="data/feline-data.csv")
cats
class(cats)

# Extract a column
cats$weight

cats$weight +2


# Show structure of an object
str(cats)

# Factor is a categorical variable, group based on unique values
# remove factors
cats2 <- read.csv(file="data/feline-data.csv", stringsAsFactors = FALSE)


# Read in gapminder
gapminder <- read.csv(file= "data/gapminder.csv", stringsAsFactors = FALSE)
str(gapminder)

nrow(gapminder)
rcol(gapminder)
nrow
dim(gapminder)
colnames(gapminder)
head(gapminder)       # get first 6 rows
tail(gapminder)       # get last 6 rows


# Summarize data
summary(gapminder)


# Assign names to a vector
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
x
names(x) <- c("a", "b", "c", "d", "e")
x

# Indexing
x[1]
x[4]
x[c(1,3)]
x[1:4]


# Excluding, give all but the second column
x[-2]
x[c(-2,-3)]


# Subsetting by name
x[c("a", "c")]


# different ways to get columns 2 thru 4, when there are 5 total columns:
x[c(2,3,4)]
x[c(-1,-5)]
x[2:4]



# Logical subsetting
x>6
x
x[x>6]  #Return vectors that are greater than 6
x[x<7]



# Subsetting data frames
gapminder$year  # use one column
gapminder[1:3,] # use first three rows and all columns
gapminder[3,]   # use a single row
gapminder[1:3, 1:3] # use first three rows and first three columns

gapminder[, c("lifeExp", "pop")]  # use all of the rows, but only two columns

gapminder$year < 1960
gapminder[gapminder$year < 1960, c("year", "pop")]



gapminder[gapminder$year==1957,]
gapminder[,-1:-4]
gapminder$lifeExp>=80
gapminder[gapminder$lifeExp>=80,]
gapminder[1,c(4,5)]
gapminder[gapminder$year==2002| gapminder$year==2007, ]




### PLOTTING

# Install the package
install.packages("ggplot2")

# Load the package
library("ggplot2")



ggplot(data = gapminder, aes(x=gdpPercap, y=lifeExp)) + geom_point()


# How life expectancy changes over time, colored by continent:
ggplot(data=gapminder, aes(x=year, y=lifeExp, color = continent)) + geom_point()

# Line Plot based on country
ggplot(data=gapminder, aes(x=year, y=lifeExp, color = continent, by=country)) + geom_line()

# Points and Lines Plot based on country
ggplot(data=gapminder, aes(x=year, y=lifeExp, color = continent, by=country)) + geom_line() + geom_point()

# Points and Lines Plot based on country, put color on line only
ggplot(data=gapminder, aes(x=year, y=lifeExp, by=country)) + geom_line(aes(color = continent)) + geom_point()


# Back to life exp vs gdp
ggplot(data = gapminder, aes(x=gdpPercap, y=lifeExp, color = continent)) + geom_point()
# Log transform
ggplot(data = gapminder, aes(x=gdpPercap, y=lifeExp, color = continent)) + geom_point() + scale_x_log10()


# Fitting a smoothing line
ggplot(data = gapminder, aes(x=gdpPercap, y=lifeExp, color = continent)) + 
  geom_point() + scale_x_log10() + geom_smooth(method = "lm")

ggplot(data = gapminder, aes(x=gdpPercap, y=lifeExp)) + 
  geom_point(size = 2) + scale_x_log10() + geom_smooth(method = "lm")


# If you have questions:
?geom_smooth



# Multi-panel figures - Facetting
ggplot(data = gapminder, aes(x=gdpPercap, y=lifeExp)) + 
  geom_point() + scale_x_log10() +
    facet_wrap(~continent)


# Facet-grid
ggplot(data = gapminder, aes(x=gdpPercap, y=lifeExp)) + 
  geom_point() + scale_x_log10() +
  facet_grid(year~continent)




# Modifying text & themes
ggplot(data=gapminder, aes(x=gdpPercap, y=lifeExp)) + geom_point() + xlab("GDP per capita") + 
  ylab("Life Expectancy") + ggtitle("Figure 1")

ggplot(data=gapminder, aes(x=gdpPercap, y=lifeExp)) + geom_point() + xlab("GDP per capita") + 
  ylab("Life Expectancy") + ggtitle("Figure 1") + theme_bw()

ggplot(data=gapminder, aes(x=gdpPercap, y=lifeExp)) + geom_point() + xlab("GDP per capita") + 
  ylab("Life Expectancy") + ggtitle("Figure 1") + theme_void()



# Saving a figure
ggplot(data=gapminder, aes(x=gdpPercap, y=lifeExp)) + geom_point() + xlab("GDP per capita") + 
  ylab("Life Expectancy") + ggtitle("Figure 1") + theme_void() + ggsave("my_figure.pdf", width=6, height=4)


