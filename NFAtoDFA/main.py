"""This module is the entry point to your assignment. There is some scaffolding
to help you get started. It will call the appropriate method (task_1, 2 etc.)
and load the input data. You can edit or remove as much of this code as you
wish to."""


from parser import Parser
from sys import stdin

def epsilonClosure(parser):
    """For each state of the NFA, compute the Epsilon closure and output
    it as a line of the form s:a,b,c where s is the state, and {a,b,c} is E(s)"""
    nfa = parser.parse_fa()
    # TODO: implement this
    
    epsilon_closure_dict = {}
    #Goes through all the state
    for state in nfa["states"]:
        temp = []
        temp.append(state)
        #if state has epsilon transition add it to the dictionary
        for d in nfa["delta"]:
            if state == d[0]:
                if d[1] == "":
                    temp.append(d[2])
        epsilon_closure_dict[state] = temp
    
    #Go through epsilon transition for each state, and find overlapping state and add if found
    #   e.g. if q1: q1, q4                     <-- That becomes
    #           q2: q2                         q1: q1, q4, q2, q3
    #           q3: q3              
    #           q4: q4, 2, 3
    for state in nfa["states"]:
        for epsilon_transition_state in epsilon_closure_dict[state]:
            for overlap in epsilon_closure_dict[epsilon_transition_state]:
                if overlap not in epsilon_closure_dict[state]:
                    epsilon_closure_dict[state].append(overlap)

    #Print our all the items in the dictionary
    for x, y in epsilon_closure_dict.items():
        print(x + ":" + ",".join(y))

    print("end")
                    
                

def nfaEnfa(parser):
    """Construct and output an equivalent Epsilon free NFA.
    The state names should not change."""
    nfa = parser.parse_fa()
    closures = parser.parse_closures()
    # TODO: implement this

    #calculating final states
    final_state = nfa["final"]
    
    #Find a state where it cotains final set in a subset
    for state in nfa["states"]:
        for f_state in nfa["final"]:
            if f_state in closures[state]:
                if state not in final_state:
                    final_state.append(state)
                    break;

    #Priting states, alphabet, start state and final state
    print(",".join(nfa["states"]))
    print(",".join(nfa["alphabet"]))
    print(nfa["start"])
    print(",".join(final_state))

    #Go through the states in each epsilon transition state and print out its destination with alphabet
    for state in nfa["states"]:
        for epsilon_state in closures[state]:
            for transition in nfa["delta"]:
                if (epsilon_state == transition[0]):
                    if transition[1] != "":
                        print(state + "," + transition[1] + "," + transition[2])

    print("end")

#Creat a 2-D list with all given alphabet such that its format is 
#   [[single alphabet, []], ...]
def get_alph_list(alp_list):
    dfa_alph_og = []
    for x in alp_list:
        dfa_alph_og.append([x, []])
    return dfa_alph_og

def enfaDfa(parser):
    """Construct and output an equivalent DFA.
    The input is guaranteed to be an Epsilon Free NFA."""
    efnfa = parser.parse_fa()
    # TODO: implement this

    #Put given transition into format of [state, [alphabet, state it reaches], []...]
    efnfa_dict = {}
    for delta in efnfa["delta"]:
        if delta[0] not in efnfa_dict.keys():
            efnfa_dict[delta[0]] = [[delta[1],delta[2]]]
        else:
            efnfa_dict[delta[0]].append([delta[1],delta[2]])
    

    dfa_list = []
    #Set existing and remaining state as the starting state
    existing_state = [[efnfa["delta"][0][0]]]
    remaining_state = [[efnfa["delta"][0][0]]]
    count = 0
    while len(remaining_state) > 0:
        dfa_alph = []
        #Get a alphabet list 
        dfa_alph = get_alph_list(efnfa["alphabet"])
        #Get a current state from remaining state to go through
        current_state = remaining_state.pop()
        for state in current_state:
            #if the sub state of current state exist in efnfa dictioanry
            if state in efnfa_dict.keys():
                #Find its transition that does not already exist and append it into the alphabet list
                for transition in efnfa_dict[state]:
                    for i in range(0, len(dfa_alph)):
                        if dfa_alph[i][0] == transition[0] and transition[1] not in dfa_alph[i][1]:
                            dfa_alph[i][1].append(transition[1])
                            break;
        #Finding if there is any new state
        for i in range(0, len(dfa_alph)):
            #Sort the list for comparison
            dfa_alph[i][1].sort()
            #if newly added state does not already exist add it to both exisiting and remaining state
            if dfa_alph[i][1] not in existing_state:
                existing_state.append(dfa_alph[i][1])
                remaining_state.append(dfa_alph[i][1])
        #Adding to dfa list
        dfa_list.append([current_state, dfa_alph])


    #Calculating final sate
    final_state =[]
    #Go through all the states there are and find the state that cotains state from the accept state.
    # Found state is added to the final state
    for state in existing_state:
        for fs in efnfa["final"]:
            if fs in state:
                if state not in final_state:
                    final_state.append(state)

    #Printing all the states
    #If empty state is found replace with "-"
    #Convert list to string so join function can be applied
    for i in range(0, len(existing_state)):
        if existing_state[i] == []:
            existing_state[i] = ["-"]
        existing_state[i] = str("-".join(existing_state[i]))
    print(",".join(existing_state))

    #Printing alphabet
    print(",".join(efnfa["alphabet"]))

    #Printing start state
    if type(efnfa["start"]) != str:
        print("-".join(efnfa["start"]))
    else:
        print(efnfa["start"])

    #Printing final state
    for i in range(0, len(final_state)):
        final_state[i] = str("-".join(final_state[i]))
    print(",".join(final_state))

    
    #Priting dfa list and replacing empty list with "-"
    for transition in dfa_list:
        for i in range(0, len(transition[1])):
            if transition[0] == [] and transition[1][i][1] == []:
                print("-"+","+str(transition[1][i][0])+","+ "-")
            elif transition[0] == []:
                print("-"+","+str(transition[1][i][0])+","+str("-".join(transition[1][i][1])))
            elif transition[1][i][1] == []:
                print(str("-".join(transition[0]))+","+str(transition[1][i][0])+","+"-")
            else:
                print(str("-".join(transition[0]))+","+str(transition[1][i][0])+","+str("-".join(transition[1][i][1])))
    
    print("end")



def computeDfa(parser):
    """For each string, output 1 if the DFA accepts it, 0 otherwise.
    The input is guaranteed to be a DFA."""
    dfa = parser.parse_fa()
    test_strings = parser.parse_test_strings()
    # TODO: implement this

    #Go through all the given input
    for test_element in test_strings:
        current_state = dfa["start"]
        #Iterate each character in the input
        for letter in test_element:
            #Check if certain state can be reached with given letter from current state
            for transition in dfa["delta"]:
                if transition[0] == current_state and transition[1] == letter:
                    current_state = transition[2]
                    break;
        #After iterating all the ltter and ends up in accept state with indicate
        if current_state in dfa["final"]:
            print(1)
        else:
            print(0)


if __name__ == '__main__':

    parser = Parser()
    command = parser.parse_command()

    if command == 'epsilon-closure':
        epsilonClosure(parser)
    elif command == 'nfa-to-efnfa':
        nfaEnfa(parser)
    elif command == 'efnfa-to-dfa':
        enfaDfa(parser)
    elif command == 'compute-dfa':
        computeDfa(parser)
    else:
        print(f'Command {repr(command)} not recognised.')
