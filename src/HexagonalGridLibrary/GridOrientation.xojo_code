#tag Class
Protected Class GridOrientation
	#tag Method, Flags = &h0
		Sub Constructor(b0 As Double, b1 As Double, b2 As Double, b3 As Double, f0 As Double, f1 As Double, f2 As Double, f3 As Double, startAngle As Double)
		  Self.B0 = b0
		  Self.B1 = b1
		  Self.B2 = b2
		  Self.B3 = b3
		  Self.F0 = f0
		  Self.F1 = f1
		  Self.F2 = f2
		  Self.F3 = f3
		  Self.StartAngle = startAngle
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		B0 As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		B1 As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		B2 As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		B3 As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		F0 As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		F1 As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		F2 As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		F3 As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		StartAngle As Double
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="F0"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="B0"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StartAngle"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="B1"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="B2"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="B3"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="F1"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="F2"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="F3"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
