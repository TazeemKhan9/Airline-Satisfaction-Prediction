# Airline-Satisfaction-Prediction
The dataset we have used contains an airline passenger satisfaction survey. The data is already separated in 2 excel files containing training and testing data. The train data contains 103904 records and the test file contained 25976 records. The data is split into 80% training and 20% testing.
The variables in the dataset are :-
1)	Gender: Gender of the passengers (Female, Male)
2)	Customer Type: The customer type (Loyal customer, disloyal customer)
3)	Age: The actual age of the passengers
4)	Type of Travel: Purpose of the flight of the passengers (Personal Travel, Business Travel)
5)	Class: Travel class in the plane of the passengers (Business, Eco, Eco Plus)
6)	Flight distance: The flight distance of this journey (0:Not Applicable;1-5)
7)	Inflight wifi service: Satisfaction level of the inflight wifi service 
8)	Departure/Arrival time convenient: Satisfaction level of Departure/Arrival time convenient (0:Not Applicable;1-5)
9)	Ease of Online booking: Satisfaction level of online booking 
10)	Gate location: Satisfaction level of Gate location 
11)	Food and drink: Satisfaction level of Food and drink 
12)	Online boarding: Satisfaction level of online boarding 
13)	Seat comfort: Satisfaction level of Seat comfort
14)	Inflight entertainment: Satisfaction level of inflight entertainment 
15)	On-board service: Satisfaction level of On-board service 
16)	Leg room service: Satisfaction level of Leg room service
17)	Baggage handling: Satisfaction level of baggage handling 
18)	Check-in service: Satisfaction level of Check-in service
19)	Inflight service: Satisfaction level of inflight service
20)	Cleanliness: Satisfaction level of Cleanliness 
21)	Departure Delay in Minutes: Minutes delayed when departure
22)	Arrival Delay in Minutes: Minutes delayed when Arrival
23)	Satisfaction: Airline satisfaction level(Satisfaction, neutral or dissatisfaction)

# Our aim in the project was to build a logistic regression model where we can accurately predict if the customer was satisfied or dissatisfied using the above variables. 

# SUMMARY
Using the above pre-processing techniques and model building, we found out that the significant variables are:-
Customer.Type
Age
Type.of.Travel
Class
Departure.Arrival.time.convenient
Ease.of.Online.booking
Online.boarding
Leg.room.service
Baggage.handling
Arrival.Delay.in.Minutes
Departure.Delay.in.Minutes

The predictions made by using the above significant variables gave us an accuracy of 88.27% when compared to the testing data.

                                                    Reference
Prediction                           neutral or dissatisfied      satisfied
neutral or dissatisfied                  13127                      1600
satisfied                                1446                       9803
