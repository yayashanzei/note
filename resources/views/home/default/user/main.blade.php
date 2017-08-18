<!doctype html>
<html lang="{{ config('app.locale') }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>{{ $blog }}</title>
    {!! $baseStatic !!}
</head>
<body>

@include($skin.'public.header')

<div class="main">
    i'm home main!
</div>

@include($skin.'public.footer')

</body>
</html>

