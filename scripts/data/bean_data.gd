extends Node
class_name BeanData
var recipes: Dictionary = {
	"test": {
		"test": {
			"description": "This is the description for the test bean",
			"grind": "medium",
			"pour": {
				"pattern": "circle",
				"steps": [
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
		},
		"test2": {
			"description": "This is the description for the second test bean",
			"grind": "low",
			"pour": {
				"pattern": "circle",
				"steps": [
					{
						"time": 25,
						"type": "cold"
					},
					{
						"time": 10,
						"type": "wait"
					},
					{
						"time": 30,
						"type": "hot"
					},
					{
						"time": 5,
						"type": "wait"
					},
					{
						"time": 25,
						"type": "hot"
					},
				]
			}
		},
		"test3": {
			"description": "This is the description for the third test bean",
			"grind": "high",
			"pour": {
				"pattern": "heart",
				"steps": [
					{
						"time": 15,
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
}
