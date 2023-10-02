<#
.SYNOPSIS
Implement two classes, one for tree node and one for binary search tree.

.DESCRIPTION
Create a binary search tree made by many different tree node.
Each tree node instance contain the value for the node and its children if exist.
The binary search tree should have these methods:
- Insert    : take in an array of number, create node and insert them follow the property of the binary search tree.
- GetData   : return the root node that contain the entire tree's data
- Search    : take in a number to find in the binary tree, return a boolean value
- Inorder   : return an array of values in order of inorder travel
- Postorder : return an array of values in order of postorder travel
- Preorder  : return an array of values in order of preorder travel

.EXAMPLE
$tree = [BinarySearchTree]::new(@(3,4,2))

$tree.Search(3)
Return: true

$tree.Inorder()
Return: @(2, 3, 4)

$tree.PreOrder()
Return: @(3, 2, 4)

$tree.Postorder()
Return: @(2, 4, 3)
#>
Class TreeNode {
    [int] $data
    [TreeNode] $left 
    [TreeNode] $right

    TreeNode([int] $data) {
        $this.data = $data
    }

    TreeNode([int] $data, [TreeNode] $left, [TreeNode] $right) {
        $this.data = $data
        $this.left = $left
        $this.right = $right
    }

    [string] ToString() {
        return "Node{data=$($this.data),$($this.left),$($this.right)}"
    }

    hidden [void] Insert([int] $value) {
        if ($value -le $this.data) {
            if ($this.left) {
                $this.left.Insert($value)
            } else {
                $this.left = [TreeNode]::new($value)
            }
        } else {
            if ($this.right) {
                $this.right.Insert($value)
            } else {
                $this.right = [TreeNode]::new($value)
            }
        }
    }

    hidden [boolean] Search([int] $value) {
        if ($value -eq $this.data) {
            return $true;
        }

        $next = if ($value -lt $this.data) { $this.left } else { $this.right }
        return ($next -and $next.Search($value))
    }

    hidden [void] InOrder([ref] $values) {
        if ($this.left) {
            $this.left.InOrder($values)
        }
        $values.Value += $this.data
        if ($this.right) {
            $this.right.InOrder($values)
        }
    }

    hidden [void] PreOrder([ref] $values) {
        $values.Value += $this.data
        if ($this.left) {
            $this.left.PreOrder($values)
        }
        if ($this.right) {
            $this.right.PreOrder($values)
        }
    }

    hidden [void] PostOrder([ref] $values) {
        if ($this.left) {
            $this.left.PostOrder($values)
        }
        if ($this.right) {
            $this.right.PostOrder($values)
        }
        $values.Value += $this.data
    }
}

Class BinarySearchTree {
    [TreeNode] $root

    BinarySearchTree([int[]] $values) {
        $this.Insert($values)
    }

    [void] Insert([int[]] $values) {
        foreach ($value in $values) {
            $this.InsertNode($value)
        }
    }

    [TreeNode] GetData() {
        return $this.root
    }

    [boolean] Search([int] $value) {
        return ($this.root -and $this.root.Search($value))
    }

    [int[]] Inorder() {
        $values = @()
        if ($this.root) {
            $this.root.InOrder([ref]$values)
        }
        return $values
    }

    [int[]] PreOrder() {
        $values = @()
        if ($this.root) {
            $this.root.PreOrder([ref]$values)
        }
        return $values
    }

    [int[]] PostOrder() {
        $values = @()
        if ($this.root) {
            $this.root.PostOrder([ref]$values)
        }
        return $values
    }

    hidden [void] InsertNode([int] $value) {
        if ($this.root) {
            $this.root.Insert($value)
        } else {
            $this.root = [TreeNode]::new($value)
        }
    }
}