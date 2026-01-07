#tag Class
Protected Class GridHex
	#tag Method, Flags = &h0
		Sub Constructor(q As Integer, r As Integer, s As Integer)
		  If Round(q + r + s) <> 0 Then
		    Raise New RuntimeException("q + r + s must be 0")
		  End If
		  
		  Self.Q = q
		  Self.R = r
		  Self.S = s
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DiagonalNeighbor(index As Integer) As GridHex
		  Var d() As GridHex = Diagonals
		  Return Self + d(index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Diagonals() As GridHex()
		  Return Array(New GridHex(2, -1, -1), New GridHex(1, -2, 1), New GridHex(-1, -1, 2), _
		  New GridHex(-2, 1, 1), New GridHex(-1, 2, -1), New GridHex(1, 1, -2))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Directon(index As Integer) As GridHex
		  Var d() As GridHex = Directons
		  Return d(index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Directons() As GridHex()
		  Return Array(New GridHex(1, 0, -1), New GridHex(1, -1, 0), New GridHex(0, -1, 1), _
		  New GridHex(-1, 0, 1), New GridHex(-1, 1, 0), New GridHex(0, 1, -1))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Distance(another As GridHex) As Integer
		  Var h As GridHex = Self - another
		  Return h.Len
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Len() As Integer
		  Return (Abs(Self.Q) + Abs(Self.R) + Abs(Self.S)) / 2
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Lerp(another As GridHex, amount As Integer) As GridHex
		  Return New GridHex(Self.Q * (1.0 - amount) + another.Q * amount, Self.R * (1.0 - amount) + another.R * amount, Self.S * (1.0 - amount) + another.S * amount)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LineDraw(b As GridHex) As GridHex()
		  Var result() As GridHex
		  
		  Var n As Integer = Distance(b)
		  Var aNudge As GridHex = New GridHex(Self.Q + 1e-06, Self.R + 1e-06, Self.S - 2e-06)
		  Var bNudge As GridHex = New GridHex(b.Q + 1e-06, b.R + 1e-06, b.S - 2e-06)
		  
		  Var lineStep As Integer = 1.0 / Max(n, 1)
		  For i As Integer = 0 To n
		    result.Add(aNudge.Lerp(bNudge, lineStep * i).round)
		  Next
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Neighbor(index As Integer) As GridHex
		  Return Self + Directon(index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Add(rhs As GridHex) As GridHex
		  Return New GridHex(Self.Q + rhs.Q, Self.R + rhs.R, Self.S + rhs.s)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Multiply(rhs As Double) As GridHex
		  Return New GridHex(Self.Q * rhs, Self.R * rhs, Self.S * rhs)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Subtract(rhs As GridHex) As GridHex
		  Return New GridHex(Self.Q - rhs.Q, Self.R - rhs.R, Self.S - rhs.s)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RotateLeft() As GridHex
		  Return New GridHex(-Self.S, -Self.Q, -Self.R)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RotateRight() As GridHex
		  Return New GridHex(-Self.R, -Self.S, -Self.Q)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Round() As GridHex
		  Var qi As Integer = Round(Self.Q)
		  Var ri As Integer = Round(Self.R)
		  Var si As Integer = Round(Self.S)
		  Var qDiff As Integer = Abs(qi - Self.Q)
		  var rDiff As Integer = Abs(ri - Self.R)
		  Var sDiff As Integer = Abs(si - Self.S)
		  
		  If qDiff > rDiff And qDiff > sDiff Then
		    qi = -ri - si
		  ElseIf rDiff > sDiff Then
		    ri = -qi - si
		  Else
		    si = -qi - ri
		  End If
		  
		  Return New GridHex(qi, ri, si)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Q As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		R As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		S As Integer
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
	#tag EndViewBehavior
End Class
#tag EndClass
