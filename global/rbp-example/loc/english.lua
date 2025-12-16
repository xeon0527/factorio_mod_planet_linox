return {
  panel_description_1 = "How to make and add a Functional blueprint to the BAD system:\n\nStep 1: Make a copy of the Concrete Flooring blueprint.\nIt is inside the blueprint book that is inside of the BAD chest.\n\nStep 2: Rename blueprint to what it is supposed to make.",
  panel_description_1_1 = "Step 3: Mark new contents (including tiles) in your new blueprint.\n\nStep 4: Place your new blueprint in the blueprint book.\n\nStep 5: Add the desired values, and the placement of the blueprint in the blueprint book, to the constant combinators.",
  panel_description_2 = "Tip: Leaving the system on but with the pause button activated costs less UPS, It is also the intended way to draw/update blueprints.\n\nTip: To find center of the BAD chest, turn the system off and use the \"BAD Chest Area Indicator\" to show the build area.",
  panel_description_2_1 = "Tip: Remember to turn on the pause button, before you draw/update a blueprint.\n\nA red light will turn on if the pause button is activated.\n\nTo \"clear the table\" turn the pause button off and on again.",
  
  panel_stage = "Stage indicators, Tells which stage is currently active.",
  panel_request = "Request indicators, Tells which stage there are requests on.",
  
  combinator_turn_on = "Green = Turn on",
  combinator_parameter = "Coordinations and size parameters.\n\nCut wires to BAD chest before turning this off.\n\nTip: To find the center coordinates click on the \"BAD chest area indicator\" button on your hotbar.",
  combinator_deconstruction = "Deconstruction Signal",
  combinator_construction = "Construction signal",
  combinator_stepper = "Stepper",
  combinator_signal_converter = "Signal Converter",
  combinator_signal_retarder = "Signal Retarder",
  combinator_signal_sorter = "This combinator tells the system which blueprint to choose, starting with the product that has the highest priority.",
  combinator_pause = "Pause Button\n\nActivate this if you want to draw/update a new blueprint.",
      
  combinator_signal_filter_1 ="Stage 1 Signal Filter",
  combinator_signal_filter_2 ="Stage 2 Signal Filter",
  combinator_id_box_1 ="Identification Box. - Stage 1\n\nProduct number should reflect the placement of the blueprint in the blueprint book.\n\nProducts are prioritised by hierarchy, with 1 being the highest.",
  combinator_id_box_2 ="Identification Box. - Stage 2\n\nProduct number should reflect the placement of the blueprint in the blueprint book.\n\nProducts are prioritised by hierarchy, with 1 being the highest.",
  combinator_signal_gate_1 = "Stage 1 Gate",
  combinator_signal_gate_2 = "Stage 2 Gate",
  combinator_latch_negative = "Product Latch\n\nNegative version: Latches on High releases on Low",
  combinator_latch_positive = "Product Latch\n\nPositive Version: Latches on Low releases on High",
  
  combinator_gate_negative_high="High Gate: Gives out a 1 for the respective product if there is more than the desired amount in storage.",
  combinator_gate_negative_low="Low Gate: Gives out a 1 for the respective product if there is less than the desired amount in storage.",
  combinator_gate_positive_high="High Gate: Gives out a 1 for the respective product if there is more than the desired amount in storage.",
  combinator_gate_positive_low="Low Gate: Gives out a 1 for the respective product if there is less than the desired amount in storage.",
  
  combinator_box_negative_high="Negative version:\n\nHigh Threshold\n\nProducts on this list will start being made once inventory goes over the set limit.",
  combinator_box_negative_low="Negative version:\n\nLow Threshold\n\nProducts on this list will stop being made once inventory goes under the set limit.",
  combinator_box_positive_high="Positive version:\n\nHigh Threshold\n\nProducts on this list will start being made once there is more of it than the set limit.",
  combinator_box_positive_low="Positive version:\n\nLow Threshold\n\nProducts on this list will stop being made once inventory goes under the set limit.",
}