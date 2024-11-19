Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2225ED60D0D
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 02:41:17 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.11967.1731984068811619782
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Nov 2024 18:41:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xxo6OSYV;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ea568d8216so1602137a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 18 Nov 2024 18:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731984068; x=1732588868; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d85tDcoQMtAI6Sg8Cw4BWd3Wpq9nKAhHaUnHlWJH4xA=;
        b=Xxo6OSYVwiYJ1OfTkP/FvjBIk3mh0EI+3qmwnuastWuzP77S3QUbkwQv9O8aV1uMeZ
         VS+tKMBi5IS3csrrKKzuew/opThWC0826RriNLFUeDNCkRaUyqU5qwLUlh7OX2vDLmzN
         AbyyJ6sMBz+fKPyo48LsJVHfVya3ZJBtwVDPr3voPWIVNB9PB5H2iCHbN/TDm1dnuvi9
         aZ1VjCSz2qP8So3YIFCdiI5n6cWp1LwWnM5bghqRuhCAzvbCqqPYFiaL6ByTQ3q2IiEO
         0UM/C6VIhW9otKCPj8wU30ergyCsobyFqathCW00kEPUft9jDKlen8NPp7/tW010A4tU
         y2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731984068; x=1732588868;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d85tDcoQMtAI6Sg8Cw4BWd3Wpq9nKAhHaUnHlWJH4xA=;
        b=VYhSeermqajHV2z3GNg0QcnFDlSovEsuHnUzeCzNUvkeM1t8UOKhMN7PCmfklC5vzI
         +hT9fEVUBuIxaTJic1ih0wNqiKRHA/PwTUxqT3tgDEQTVzufNU4uVvZNtRc0/QG5E9M7
         GZw6coYnKWEDoKAYYV77/O+KjzpXhCwDw1GO2jJc++/HYCHu9PQF3LIapTTBaGeypf2X
         o3p2IF1IcbyKEtfYVifOEfY9lxBNA0rESPT3t6Jw4Qi7z+0A3jGaalVJRoVV+WyOSSW5
         Gs6Y5aK3Gaq+/nThZN0mne81TdXk2MebPlK+tdT6/3U5VtGe1PGdqUhaBZEeppIT4qlk
         8tiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAzraz+gCbcqzTy/NEZzcP9UPDLO3wx2hD1rTn13/8avhj3FQSQDHeX/wTbLf4NYhmTxRJgKs+fFe2xg9xc3EmvO/k@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yyg2xFzqC1iUaTablZBdVb47+/DZHpkaUsYaHFPCmO3YQr+TA/1
	/wsUwN6PYdl/PpctCVb23ZJQOyUl265W9IebXwU5lzBb5mQET3zYgNSZ0lRjt51DDlOCzj0kpEX
	/OIFRCxmnz157Tq8J7Bhx8YThZpo=
X-Google-Smtp-Source: AGHT+IHFOYQkHhbxm4aWyKxy6nsAI9vxMuPbCfqKk4Sr5rXwIuK/OvHboKspFW/NKBuTdhcVLQexWIwmCsQpZ+/SzH8=
X-Received: by 2002:a17:90b:250d:b0:2ea:2a8d:dd24 with SMTP id
 98e67ed59e1d1-2ea2a8decb2mr14652446a91.24.1731984068062; Mon, 18 Nov 2024
 18:41:08 -0800 (PST)
MIME-Version: 1.0
References: <20241118223240.2479834-1-stanley.stanton@taitcommunications.com> <18093DBF1757132A.18574@lists.yoctoproject.org>
In-Reply-To: <18093DBF1757132A.18574@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 18 Nov 2024 21:40:56 -0500
Message-ID: <CADkTA4Mc5RRPd_vJ5Bt4KDrCyvfB_H4EGwojXY+SAN8F--puqg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] xen.inc: python 3.12: fix datetime
 deprecation warning
To: bruce.ashfield@gmail.com
Cc: stanley.stanton@taitcommunications.com, 
	meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000002235b206273af763"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Nov 2024 02:41:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8974

--0000000000002235b206273af763
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2024 at 9:30=E2=80=AFPM Bruce Ashfield via lists.yoctoproje=
ct.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:

>
>
> On Mon, Nov 18, 2024 at 5:32=E2=80=AFPM Stanley Stanton via lists.yoctopr=
oject.org
> <stanley.stanton=3Dtaitcommunications.com@lists.yoctoproject.org> wrote:
>
>> Datetime.UTC seems is a wrapper for datetime.timezone.utc,
>> which is available on both python 3.10, and python 3.12 (Ubuntu 24.04)
>> so, opt to use that instead.
>>
>
> No objection to the patch, but this commit log doesn't actually tell me
> what the problem is, so I can't tell what this is fixing.
>

Sorry, what I meant to say (and I said it badly), is that we should capture
the warning that is being thrown, since that is what someone will search
for if they are having the same issue.

We also need to make sure that all of the versions of python (and hosts)
supported by OE core / yocto have the function in question (or does this
just get executed by python3-native and not the host python ? .. I'll have
to check on that tomorrow, I can't recall right now).  Your current commit
log makes me think that it is the host distro python, otherwise, the
version of python in ubuntu 24.04 isn't relevant.

Bruce



>
> Bruce
>
>
>
>>
>> Signed-off-by: Stanley Stanton <stanley.stanton@taitcommunications.com>
>> ---
>>  recipes-extended/xen/xen.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
>> index dcd281b5..63790f73 100644
>> --- a/recipes-extended/xen/xen.inc
>> +++ b/recipes-extended/xen/xen.inc
>> @@ -151,7 +151,7 @@ def get_build_time_vars(d):
>>      source_date_epoch =3D d.getVar('SOURCE_DATE_EPOCH')
>>      if source_date_epoch is not None:
>>          import datetime
>> -        utc_datetime =3D
>> datetime.datetime.utcfromtimestamp(float(source_date_epoch))
>> +        utc_datetime =3D
>> datetime.datetime.fromtimestamp(float(source_date_epoch),
>> datetime.timezone.utc)
>>          return " XEN_BUILD_DATE=3D" + utc_datetime.strftime("%Y-%m-%d")=
 + \
>>                 " XEN_BUILD_TIME=3D" + utc_datetime.strftime("%H:%M:%S")
>>      return ""
>> --
>> 2.43.0
>>
>>
>> --
>>
>> This communication is confidential. We only send and receive email on th=
e
>> basis of the terms set out at www.taitcommunications.com/email_disclaime=
r
>> <http://www.taitcommunications.com/email_disclaimer>
>>
>>
>>
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8973):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8973
> Mute This Topic: https://lists.yoctoproject.org/mt/109654730/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000002235b206273af763
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Nov 18, 2024 at 9:30=E2=80=AFPM Bruce Ashfi=
eld via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a=
> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org">=
gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div sty=
le=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 18, 2024 at 5:32=E2=80=AFPM St=
anley Stanton via <a href=3D"http://lists.yoctoproject.org" target=3D"_blan=
k">lists.yoctoproject.org</a> &lt;stanley.stanton=3D<a href=3D"mailto:taitc=
ommunications.com@lists.yoctoproject.org" target=3D"_blank">taitcommunicati=
ons.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Datetime.UTC seems is a wrapper for datetime.=
timezone.utc,<br>
which is available on both python 3.10, and python 3.12 (Ubuntu 24.04)<br>
so, opt to use that instead.<br></blockquote><div><br></div><div><div style=
=3D"font-size:small">No objection to the patch, but this commit log doesn&#=
39;t actually tell me what the problem is, so I can&#39;t tell what this is=
 fixing.</div></div></div></div></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">Sorry, what I meant to say (an=
d I said it badly), is that we should capture the warning that is being thr=
own, since that is what someone will search for if they are having the same=
 issue.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">We also need to m=
ake sure that all of the versions of python (and hosts) supported by OE cor=
e / yocto have the function in question (or does this just get executed by =
python3-native and not the host python ? .. I&#39;ll have to check on that =
tomorrow, I can&#39;t recall right now).=C2=A0 Your current commit log make=
s me think that it is the host distro python, otherwise, the version of pyt=
hon in ubuntu 24.04 isn&#39;t relevant.</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><di=
v><div style=3D"font-size:small"><br></div><div style=3D"font-size:small">B=
ruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
Signed-off-by: Stanley Stanton &lt;<a href=3D"mailto:stanley.stanton@taitco=
mmunications.com" target=3D"_blank">stanley.stanton@taitcommunications.com<=
/a>&gt;<br>
---<br>
=C2=A0recipes-extended/xen/xen.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br=
>
index dcd281b5..63790f73 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -151,7 +151,7 @@ def get_build_time_vars(d):<br>
=C2=A0 =C2=A0 =C2=A0source_date_epoch =3D d.getVar(&#39;SOURCE_DATE_EPOCH&#=
39;)<br>
=C2=A0 =C2=A0 =C2=A0if source_date_epoch is not None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0import datetime<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 utc_datetime =3D datetime.datetime.utcfromtime=
stamp(float(source_date_epoch))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 utc_datetime =3D=C2=A0 datetime.datetime.fromt=
imestamp(float(source_date_epoch), datetime.timezone.utc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot; XEN_BUILD_DATE=3D&quot; + u=
tc_datetime.strftime(&quot;%Y-%m-%d&quot;) + \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; XEN_BUILD_TI=
ME=3D&quot; + utc_datetime.strftime(&quot;%H:%M:%S&quot;)<br>
=C2=A0 =C2=A0 =C2=A0return &quot;&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-- <br>
<br>
This communication is confidential. We only send and receive email on the<b=
r>
basis of the terms set out at <a href=3D"http://www.taitcommunications.com/=
email_disclaimer" rel=3D"noreferrer" target=3D"_blank">www.taitcommunicatio=
ns.com/email_disclaimer</a> <br>
&lt;<a href=3D"http://www.taitcommunications.com/email_disclaimer" rel=3D"n=
oreferrer" target=3D"_blank">http://www.taitcommunications.com/email_discla=
imer</a>&gt;<br>
<br>
<br>
<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8973): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8973" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8973</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/109654730/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/109654730/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000002235b206273af763--

