#tag Class
Protected Class GridOffsetCoord
	#tag Method, Flags = &h0
		Sub Constructor(column As Integer, row As Integer)
		  Self.Column = column
		  Self.Row = row
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function QOffsetFromCube(offset As OffsetTypes, h As GridHex) As GridOffsetCoord
		  Var parity As Integer = Bitwise.BitAnd(h.Q, 1)
		  Var col As Integer = h.Q
		  Var row As Integer = h.R + (h.Q + CType(offset, Integer) * parity) / 2
		  
		  Return New GridOffsetCoord(col, row)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function QOffsetToCube(offset As Integer, h As GridOffsetCoord) As GridHex
		  Var parity As Integer = Bitwise.BitAnd(h.Column, 1)
		  Var q As Integer = h.Column
		  Var r As Integer = h.Row - (h.Column + CType(offset, Integer) * parity) / 2
		  Var s As Integer = -q - r
		  
		  Return New GridHex(q, r, s)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ROffsetFromCube(offset As OffsetTypes, h As GridHex) As GridOffsetCoord
		  Var parity As Integer = Bitwise.BitAnd(h.R, 1)
		  Var col As Integer = h.Q + (h.R + CType(offset, Integer) * parity) / 2
		  Var row As Integer = h.R
		  
		  Return New GridOffsetCoord(col, row)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ROffsetToCube(offset As Integer, h As GridOffsetCoord) As GridHex
		  Var parity As Integer = Bitwise.BitAnd(h.Row, 1)
		  Var q As Integer = h.Column - (h.Row + CType(offset, Integer) * parity) / 2
		  Var r As Integer = h.Row
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


	#tag Constant, Name = kEven, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kOdd, Type = Double, Dynamic = False, Default = \"-1", Scope = Private
	#tag EndConstant


	#tag Enum, Name = OffsetTypes, Type = Integer, Flags = &h0
		Odd = -1
		Even = 1
	#tag EndEnum


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
