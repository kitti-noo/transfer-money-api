# transfer-money-api
## Software recommendation
Visual Studio Code
* VS Code Extension `Robot Framework Language Server`, ` Python Extension Pack`

## Installation
1. Python (Recommended version = 3.9(++))
2. Create virtual environment
`python3 -m venv venv` or `python -m venv venv`
3. Access virtual environment
- For Mac: type `source venv/bin/activate`
- For Windows: type  `.\venv\Scripts\activate`
4. Install Robot Framework and Libraries
`pip install -r requirements.txt`

## Execute
```
robot -d result testcases/transfer_money_api.robot
```