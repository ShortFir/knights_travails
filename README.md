# knights_travails
<h1>The Odin Project</h1>

<h2>Knights Travails</h2>

<a href="https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/knights-travails">Original Page</a>

<p>Now you’re a pro with DFS and BFS.  Let’s try using our search algorithms on a real problem.</p>

<p>For this project, you’ll need to use a data structure that’s similar (but not identical) to a binary tree. For a summary of a few different examples, reference <a href="https://www.khanacademy.org/computing/computer-science/algorithms/graph-representation/a/describing-graphs">this article</a>.</p>

<p>A knight in chess can move to any square on the standard 8x8 chess board from any other square on the board, given enough turns (don’t believe it?  See <a href="https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Knight%27s_tour_anim_2.gif/250px-Knight%27s_tour_anim_2.gif">this animation</a>).  Its basic move is two steps forward and one step to the side.  It can face any direction.</p>

<p>All the possible places you can end up after one move look like this:</p>

<p><img src="https://i.imgur.com/mHQqH08.gif" /></p>

<h3 id="assignment">Assignment</h3>
<p>Your task is to build a function <code>knight_moves</code> that shows the simplest possible way to get from one square to another by outputting all squares the knight will stop on along the way.</p>

<p>You can think of the board as having 2-dimensional coordinates.  Your function would therefore look like:</p>

<ul>
  <li><code>knight_moves([0,0],[1,2]) == [[0,0],[1,2]]</code></li>
  <li><code>knight_moves([0,0],[3,3]) == [[0,0],[1,2],[3,3]]</code></li>
  <li><code>knight_moves([3,3],[0,0]) == [[3,3],[1,2],[0,0]]</code></li>
</ul>

<div class="lesson-content__panel">
  <ol>
    <li>Put together a script that creates a game board and a knight.</li>
    <li>Treat all possible moves the knight could make as children in a tree.  Don’t allow any moves to go off the board.</li>
    <li>Decide which search algorithm is best to use for this case.  Hint: one of them could be a potentially infinite series.</li>
    <li>Use the chosen search algorithm to find the shortest path between the starting square (or node) and the ending square.  Output what that full path looks like, e.g.:</li>
  </ol>

  <pre><code class="language-bash">  &gt; knight_moves([3,3],[4,3])
  =&gt; You made it in 3 moves!  Here's your path:
    [3,3]
    [4,5]
    [2,4]
    [4,3]
</code></pre>
</div>