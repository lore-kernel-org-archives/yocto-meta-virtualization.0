Received: from 2.mo173.mail-out.ovh.net (2.mo173.mail-out.ovh.net [178.33.251.49])
 by mx.groups.io with SMTP id smtpd.web10.14237.1602169230343444299
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 08 Oct 2020 08:00:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: 3mdeb.com, ip: 178.33.251.49, mailfrom: maciej.pijanowski@3mdeb.com)
Received: from player158.ha.ovh.net (unknown [10.108.4.98])
	by mo173.mail-out.ovh.net (Postfix) with ESMTP id C8729150728
	for <meta-virtualization@lists.yoctoproject.org>; Thu,  8 Oct 2020 17:00:27 +0200 (CEST)
Received: from 3mdeb.com (85-222-117-222.dynamic.chello.pl [85.222.117.222])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player158.ha.ovh.net (Postfix) with ESMTPSA id E510416ECD848;
	Thu,  8 Oct 2020 15:00:25 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-99G00327f734ae-8df8-44d3-90c0-e28d035dbe73,
                    9BDB21CE6912D189679EFBF3351B5BED2E29563B) smtp.auth=maciej.pijanowski@3mdeb.com
Subject: Re: [meta-virtualization] dunfell/5.8.x kernel/Docker version 19.03.8-ce
To: Robert Berger <robert.berger.yocto.user@gmail.com>,
 meta-virtualization@lists.yoctoproject.org
References: <QqEr.1602167734052560613.bjmh@lists.yoctoproject.org>
From: "Maciej Pijanowski" <maciej.pijanowski@3mdeb.com>
Message-ID: <3ec52728-7c70-0e78-c0a5-306a3e2ea0a4@3mdeb.com>
Date: Thu, 8 Oct 2020 17:00:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <QqEr.1602167734052560613.bjmh@lists.yoctoproject.org>
X-Ovh-Tracer-Id: 2993486378567937713
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrgeelgdehjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepuffvfhfhkffffgggjggtsegrtderredtfeejnecuhfhrohhmpeforggtihgvjhcurfhijhgrnhhofihskhhiuceomhgrtghivghjrdhpihhjrghnohifshhkihesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnheptdffkeeigfeiudehkeehtdeugeetgfetffefvefgieduteffleeutdeuvdevjeehnecuffhomhgrihhnpehprghsthgvsghinhdrtghomhdphihotghtohhprhhojhgvtghtrdhorhhgpdefmhguvggsrdgtohhmnecukfhppedtrddtrddtrddtpdekhedrvddvvddruddujedrvddvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhduheekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepmhgrtghivghjrdhpihhjrghnohifshhkihesfehmuggvsgdrtghomhdprhgtphhtthhopehmvghtrgdqvhhirhhtuhgrlhhiiigrthhiohhnsehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
Content-Type: multipart/alternative;
 boundary="------------B091B8B52E4D0F88BC7EC331"
Content-Language: en-US

--------------B091B8B52E4D0F88BC7EC331
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


On 08.10.2020 16:35, Robert Berger wrote:
> Hi,
>
> It looks like with a 5.8.x kernel docker is not happy anymore with
> iptables and kills the socket.
>
> https://pastebin.com/U702eC9G
>
> Are there any suggested fixes for this?
The kernel-module-xt-masquerade is missing.
Docker could RRECOMMENDS on it.
>
> Regards,
>
> Robert
>
> 
>
-- 
Maciej Pijanowski
Embedded Systems Engineer
GPG: 9963C36AAC3B2B46
https://3mdeb.com | @3mdeb_com


--------------B091B8B52E4D0F88BC7EC331
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 08.10.2020 16:35, Robert Berger
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:QqEr.1602167734052560613.bjmh@lists.yoctoproject.org">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      Hi,<br>
      <br>
      It looks like with a 5.8.x kernel docker is not happy anymore with
      iptables and kills the socket.<br>
      <br>
      <span style="font-size: 14px;"><a
          href="https://pastebin.com/U702eC9G" target="_blank"
          rel="noopener" moz-do-not-send="true">https://pastebin.com/U702eC9G</a><br>
        <br>
        Are there any suggested fixes for this?<br>
      </span></blockquote>
    The kernel-module-xt-masquerade is missing.<br>
    Docker could RRECOMMENDS on it.<br>
    <blockquote type="cite"
      cite="mid:QqEr.1602167734052560613.bjmh@lists.yoctoproject.org"><span
        style="font-size: 14px;"><br>
        Regards,<br>
        <br>
        Robert</span>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
Maciej Pijanowski
Embedded Systems Engineer
GPG: 9963C36AAC3B2B46
<a class="moz-txt-link-freetext" href="https://3mdeb.com">https://3mdeb.com</a> | @3mdeb_com</pre>
  </body>
</html>

--------------B091B8B52E4D0F88BC7EC331--
