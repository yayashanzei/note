<!doctype html>
<html lang="{{ config('app.locale') }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>{{ $title }}</title>
    {!! $baseStatic !!}
    <link rel="stylesheet" type="text/css" href="{{ $path['css'] }}/redirect.css" />

</head>

<body>
<div class="system-message">
	@php switch ($code) {
	 case 1: @endphp
    <h1 class="fa fa-check-circle-o" style="color:#22CC77"></h1>
    <p class="success">@php echo(strip_tags($msg)); @endphp</p>
	@php break;
	  case 0: @endphp
    <h1 class="fa fa-times-circle-o" style="color:#F33"></h1>
    <p class="error">@php echo(strip_tags($msg)); @endphp</p>
	@php break;
	 case 2:@endphp
    <h1 class="fa fa-exclamation-circle" style="color:#ff9900"></h1>
    <p class="error">@php echo(strip_tags($msg)); @endphp</p>
	@php break;
	 } @endphp
    <p class="detail"></p>
    <p class="jump">
        页面自动 <a id="href" class="text-primary" href="@php echo($url); @endphp">跳转</a> 等待时间： <b id="wait">@php echo($wait); @endphp</b>
    </p>
</div>
<script type="text/javascript">
	(function(){
		var wait = document.getElementById('wait'),
			href = document.getElementById('href').href;
		var interval = setInterval(function(){
			var time = --wait.innerHTML;
			if(time <= 0) {
				location.href = href;
				clearInterval(interval);
			};
		}, 1000);
	})();
</script>
</body>
</html>


