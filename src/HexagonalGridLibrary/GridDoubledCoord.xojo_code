#tag Class
Protected Class GridDoubledCoord
	#tag Method, Flags = &h0
		Sub Constructor(column As Integer, row As Integer)
		  Self.Column = column
		  Self.Row = row
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function QDoubledFromCube(h As GridHex) As GridDoubledCoord
		  Var col As Integer = h.Q
		  Var row As Integer = 2 * h.R + h.Q
		  
		  Return New GridDoubledCoord(col, row)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function QDoubledToCube() As GridHex
		  Var q As Integer = Self.Column
		  Var r As Integer = (Self.Row - Self.Column) / 2
		  Var s As Integer = -q - r
		  
		  Return New GridHex(q, r, s)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function RDoubledFromCube(h As GridHex) As GridDoubledCoord
		  Var col As Integer = 2 * h.Q + h.R
		  Var row As Integer = h.R
		  
		  Return New GridDoubledCoord(col, row)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RDoubledToCube() As GridHex
		  Var q As Integer = (Self.Column - Self.Row) / 2
		  Var r As Integer = Self.Row
		  Var s As Integer = -q - r
		  
		  Return New GridHex(q, r, s)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Column As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Row As Integer
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
			Name="Column"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
