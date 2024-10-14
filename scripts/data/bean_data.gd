extends Node
class_name BeanData
var recipes: Dictionary = {
	"test": {
		"test": {
			"description": "This is the description for the test bean",
			"grind": "medium",
			"pour": [
				{
					"time": 30,
					"type": "hot"
				},
				{
					"time": 10,
					"type": "wait"
				},
				{
					"time": 20,
					"type": "cold"
				},
				{
					"time": 5,
					"type": "wait"
				},
				{
					"time": 20,
					"type": "hot"
				},
			]
		}
	}
}
