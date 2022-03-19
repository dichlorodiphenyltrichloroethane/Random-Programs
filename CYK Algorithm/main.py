from parser import Parser
from sys import stdin

def membership(parser):
    """For each string, decide if it is in the language."""
    cfg = parser.parse_cfg()
    test_strings = parser.parse_test_strings()
    # TODO: implement this
    # print(test_strings)
    
    for string in test_strings:
        table = []

        #calculating all the variables for the base row
        base_row = []
        for letter in string:
            incld_var = []
            for rule in cfg["rules"]:
                if ("".join(rule[1]) == letter):
                    incld_var.append(rule[0])
            base_row.append(incld_var)
        table.append(base_row)
        #End of calculating Base Row

        string_len = len(string) - 1
        
        new_row = []
        new_row_idx = 0
        table_idx = 0
        #Setting up table
        for i in range(1, string_len + 1):
            table.append([])
            for j in range(i, string_len + 1):
                table[i].append([])
        #Iterate through each row in the table to calculate each cell in the table
        for r in range(1, string_len + 1):
            m = 1
            for i in range(0, r):
                k = r - i - 1
                m = 1 + i
                for j in range(0, string_len - r + 1):
                    #Go through each variable in the cell for cartesian product with x, y
                    for x in table[i][j]:
                        for y in table[k][m]:
                            for rule in cfg["rules"]:
                                #If result of cartesian product exits in the rule 
                                #   and does not already exits in the table[r][j] add it
                                if (rule[1] == [x, y]):
                                    if (table[r][j] == []):
                                        table[r][j] = [rule[0]]
                                    elif (rule[0] not in table[r][j]):
                                        table[r][j].append(rule[0])
                    m += 1
        #Checking if the last cell (table[0][n]) contains the starting symbol
        check_flag = 0
        for var in table[string_len][0]:
            if (var == cfg["start"]):
                check_flag = 1
                break
        print(check_flag)
            
    print("end")



if __name__ == '__main__':

    parser = Parser()
    command = parser.parse_command()

    if command == 'membership':
        membership(parser)
    else:
        print(f'Command {repr(command)} not recognised.')

