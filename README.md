# UCSB-Datathon-2026
The UCSB Datathon



## Analysis (Written DURING Datathon)
The fox weight has decreased over the span of 3 years. <br>
Some things to keep in mind when analyzing the fox weight, the majority of the foxes are male (53% to 47%, rounded), which means the weight will inherently run higher as the structure of a male is larger than a female. 
<br>
This can be seen with the graph on line 39-41. We can see how it effects the weight class by running lines 44-50. By using group_by, we can find that the average weight for females (1.88) kilograms is less than males, (1.99) kilograms.
<br>
By looking at the average by year, we can find that the female weight has decreased, 
2014, the average weight was 1.95, 2015, 1.85, and 1.86 in 2016, meaning overall a loss of 0.09 kilograms.
<br>
Looking at the male population, by looking at the average by year, the male weight has also decreased. In 2014, the average weight was 2.08, in 2015, the average was 1.95, and 1.99 in 2016, meaning an overall a loss of 0.09 kilograms. 
<br><br>
**Challenge Questions:**
1. Do the foxes on different islands have the same weight? Is there an island where the foxes are significantly heavier than others? To conduct such analysis, you can filter by different Islands:
Foxes on different islands do not have the same weight, as the SRI island has a wider range of weights based on the graph on lines 95-101. SRI has both lighter and heavier foxes
<br>
2. Do vaccinated foxes have a different weight compared to unvaccinated ones?
It looks like certain vaccines make the foxes thinner, as the graph on lines 104-109 shows there are fewer foxes who received their vaccinations that are on the heavier side.
<br>
3. The dataset has a variable called BodyCondition. What proportion of foxes are well nourished? Do some islands have a larger proportion of “fat” foxes than others? How does BodyCondition connect with Weight? For the latter, you could look into scatter plots.
If we consider emaciated and thin as not well-nourished, then 0.4702593 are well nourished. With body condition and weight, the heavier the fox, the better the body condition/the more well nourished.


## Learning Links
[Morning Lab, learning R and setup](https://mludkov.github.io/UCSB_Data_Day_2026/docs/morning.html)
<br>
[Datathon: Hands on Activity](https://mludkov.github.io/UCSB_Data_Day_2026/docs/datathon.html)
<br>
[Downloadable dataset (we did not end up using?)](https://www.gapminder.org/data/)
