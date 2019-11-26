Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web12.14352.1574786535703602205
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Nov 2019 08:42:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jhyWK8La;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id j13so21356509ioe.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 26 Nov 2019 08:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dFAJG6tVADdaHVtNkKZ/zBwgZ5gC4w4k3rHxkigTDUo=;
        b=jhyWK8LaNIBfCH7UNAtoqfthMuF9uL2eBpt0xLW0rP77kJKIv4FmEUM8JCQeaUeXqn
         NiHQjHfC4VC8SfF3uAZVP/TOYu1Q5XqQp1EtrMR2TlDDxbfQudG3+JJSrtOH8C5eZoh3
         3aCncJflX1f+Ya6kwWZZjqQPE7iTusimo1CJvaVmbg83IgQTnOYeTN8iIh1eiYhFX9rL
         sYfiNHeVs1N0KYUrjxX/IpObPJoZbHnbGBL9icEDmLMiyRoC+n5DGiio7TuabYEPJuTY
         auw2LhR9+QN9bOVaFOUdxuGik1Tf4EPS7+lq9V71VDbj8WTUMiAhvKUOmv9tEN3imlK0
         jdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dFAJG6tVADdaHVtNkKZ/zBwgZ5gC4w4k3rHxkigTDUo=;
        b=NfxmjhEbMebeOKU6SILvxOzgooXpLUwdDeeli2s86rlXAUpyiyy86BemIDADe7EToc
         LoOBTJ7v6vPDUqLJc6P7evTPTz6PlXnZ3K3MKhRsl3GhK7wrTpPYbAm6c0vLxZhICa9o
         KWjI29lHH5TifUI7g35Pr7/324pq7bUKrPKwo9e03AoDULW4cNn+oqjQV3f8GSykOVL1
         z34/Et85FxuEAxB81YcfqbCwxqIRiGWp+UDR9Fat593WE3Bxm+8RAEi2WwRZF0UIIAGJ
         Vrl1NBC/18w33f1kpbkmSh8c+ra+xBIqOILoO5tXHZGeJpQ7RdCJYAGKwALHliofnVz1
         iixA==
X-Gm-Message-State: APjAAAVlCzzac76B1zH9EPh9UwlcVVSy85LNw+z9wObqHA/GNi/TQzBM
	VvT1gHDANGTHV8Z0fyMN0RXoptBiB6/uj3ZW4W0=
X-Google-Smtp-Source: APXvYqwZ3mkOF0qIP7+5SYZG8CalUwV0Oj31/fuG7jOgUlC/z/LZPLBEygqrxKWFJC9Ezj3QDFy5S4KhfzJlGVI3GW0=
X-Received: by 2002:a05:6602:24c7:: with SMTP id h7mr17577131ioe.151.1574786534959;
 Tue, 26 Nov 2019 08:42:14 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4N5=fsC-gZ4W8TYExqjXiKtQCH7Sr1SiERDZvVd-j-h7w@mail.gmail.com>
In-Reply-To: <CADkTA4N5=fsC-gZ4W8TYExqjXiKtQCH7Sr1SiERDZvVd-j-h7w@mail.gmail.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Tue, 26 Nov 2019 08:42:02 -0800
Message-ID: <CANx9H-C8fe8T9su8SEeHuaxic8sn7cgbqxC95tOGow15yjOBmg@mail.gmail.com>
Subject: Re: [meta-virtualization] python2 removal
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000000374890598429017"

--0000000000000374890598429017
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 26, 2019 at 8:40 AM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> Hi all,
>
> Just a heads up that we have to (collectively) remove python2 dependencies
> from the layer. oe-core will soon be python2, and the host tools
> underpinnings will also be removed. meta-python will go python3 only, etc.
>
> So I'll start looking at the remaining python2 dependencies and see about
> what can be dropped, upgraded or blacklisted.
>
> If anyone is already working on a particular recipe, let me know
> (preferably by replying to this email) and we can avoid duplicated efforts.
>
>
meta-python2 will be created this week and can accept recipes that people
need to keep alive
--Tim

> Bruce
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#4754):
> https://lists.yoctoproject.org/g/meta-virtualization/message/4754
> Mute This Topic: https://lists.yoctoproject.org/mt/61961927/924729
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

--0000000000000374890598429017
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 26, 2019 at 8:40 AM Bruce=
 Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr"><div style=3D"font-size:small">Hi all,</div><div st=
yle=3D"font-size:small"><br></div><div style=3D"font-size:small">Just a hea=
ds up that we have to (collectively) remove python2 dependencies from the l=
ayer. oe-core will soon be python2, and the host tools underpinnings will a=
lso be removed. meta-python will go python3 only, etc.</div><div style=3D"f=
ont-size:small"><br></div><div style=3D"font-size:small">So I&#39;ll start =
looking at the remaining python2 dependencies and see about what can be dro=
pped, upgraded=C2=A0or blacklisted.</div><div style=3D"font-size:small"><br=
></div><div style=3D"font-size:small">If anyone is already working on a par=
ticular recipe, let me know (preferably by replying to this email) and we c=
an avoid duplicated efforts.</div><div style=3D"font-size:small"><br></div>=
</div></blockquote><div><br></div><div>meta-python2 will be created this we=
ek and can accept recipes that people need to keep alive</div><div>--Tim<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><=
div style=3D"font-size:small"></div><div style=3D"font-size:small">Bruce</d=
iv><div><br></div>-- <br><div dir=3D"ltr">- Thou shalt not follow the NULL =
pointer, for chaos and madness await thee at its end<br>- &quot;Use the for=
ce Harry&quot; - Gandalf, Star Trek II<br><br></div></div>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
<br>
View/Reply Online (#4754): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/4754" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/4754</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/61961927/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt/=
61961927/924729</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a>=C2=A0 [<a href=3D"mailto:ticotimo@gmail.c=
om" target=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
</blockquote></div></div>

--0000000000000374890598429017--
