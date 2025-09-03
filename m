Return-Path: <joaohf@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC5ECA1009
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 13:11:52 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.12029.1756905104535492037
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 Sep 2025 06:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DZ02yr2m;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: joaohf@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e96eaceb574so838857276.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 03 Sep 2025 06:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756905104; x=1757509904; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GL9dw/GQIYqUgsFIxrGz6VjD5eMx3IaYXuzzE459PS4=;
        b=DZ02yr2m11nURIElLbtGSXRuPnCYmfOj+zUIaHH+5X+v+gQoQHPaSi6l/Ti/WRAscq
         agYFWWVdJ4E7RlXCB5QaX002fU00LGemeSQk4LV92MQWmlQcfV52KKx8pJjNyZAzUSHG
         gQW0Q4CUI53Lzw6H5gKo2N+/IIABueisB5412AC1LkECiwwoNdtIp+d7ddJEEScz38sK
         zAMspSGvrHX8zgFYeMGr8Pbet0NHqN+/akBR8Kl6HB1XfQw9IfkDRpXm8FLfmPGiXC+b
         cxyf277p0whfffaNZ9Ja9U0SaeoX0XUcTgtwi3Lj14AsRhXZc9je4Eb0Eclg/fuKuK6M
         Hg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756905104; x=1757509904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GL9dw/GQIYqUgsFIxrGz6VjD5eMx3IaYXuzzE459PS4=;
        b=hcorSV+IO9K2WPjUR6znTnmrDt2NaoSi9BhejgppDF0lV4HRPn1W4tAccDGKKaf2kh
         hw8lEgenise9NcFbSukdJvA4QUjl7yAS43pGuC18jjCz2L7maxdA0Ay/WRFiwk1r5kvK
         B0nmEYhx1c2f15A1DdDCZLjuxZ/VGmvGkBA/29YxSyo3eAgzIdT70ZKSWlbXLOYqEcKX
         lqMjCLrxCP5nRPpHI2EZ+8CFSnM613fhrTutzfiUSM5aFVFC58UxtXiAlUlNPtoRi+oK
         ixNMYA6HdzeIoN3VN1XXe5A4KLLc6mb1aiFAFoTotxzBJ2Jz+snF+JkrAcqGJsT682JC
         hV3Q==
X-Gm-Message-State: AOJu0YwAB64CROfJ9eEgUUYzHzdGzwAb6MlpOz+6oSsTCGiABiMdJ0dA
	+fWSe/uBIChYNtFQ/9twNBiviZoW6A4DmAx8XNoRhUItJ9CDOcGuKnZWotZpYzdYI1PrbOR4Faz
	4YYfBiKjnN+XR3y/ltUJDox5mSZ5rbeo=
X-Gm-Gg: ASbGncssDRaGXAHPydlgp5Hk1zdd2p17jRGZb0gKvyxG9Qt5bl3MvW/2Qx2ZwlxpDNT
	LIm7jzJ7BB2uwGNMQGsYkoHBdSIwPz4m5Tad96cxoAcUpJrmnw2D7FModUHexvA8WYrTbjizZTy
	NULfwH9OnjFkdCkULoxGacV6vZb1ChZMXB3QiuTnDVQKdC7gs9wPaLiXF0vgTx64XKbV+uI+5aO
	WvTCgWVKA==
X-Google-Smtp-Source: AGHT+IE6xOiMEgVzW4pne08noHS1DoXK/U68VxT9HS5g3x6cpBx18FtuxPx94BwW+fb70P7ML758a1INCmQUJ4mmrIs=
X-Received: by 2002:a05:6902:1022:b0:e90:5a9d:1535 with SMTP id
 3f1490d57ef6-e989be97df5mr12077601276.1.1756905103429; Wed, 03 Sep 2025
 06:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <CANFVK79QdSO79V83OZW2ZoFC-Ey76Ypb+9BAFvg4Ko7v5rg89w@mail.gmail.com>
 <CADkTA4PJ4O5HbwL9LmfvNxWwXgXAp5sCZkQW=c7QPeOC+vWTJw@mail.gmail.com>
In-Reply-To: <CADkTA4PJ4O5HbwL9LmfvNxWwXgXAp5sCZkQW=c7QPeOC+vWTJw@mail.gmail.com>
From: =?UTF-8?Q?Jo=C3=A3o_Henrique_Freitas?= <joaohf@gmail.com>
Date: Wed, 3 Sep 2025 10:11:30 -0300
X-Gm-Features: Ac12FXzqs1egdeSkP_LwIa2glWPTdnoY-NSlwHssjUBh5Yug9hoz54gyFtS58tY
Message-ID: <CANFVK7-VXxz__V5ScKQV1tzodsPYrg_eJG1rZJX=NKGshjFSLQ@mail.gmail.com>
Subject: Re: [meta-virtualization] About rabbitmq (from meta-erlang) for meta-openstack
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000981aaa063de558ce"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 03 Sep 2025 13:11:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9364

--000000000000981aaa063de558ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

Alright, thanks for your answer.

I've updated rabbitmq recipe:
https://github.com/meta-erlang/meta-erlang/commit/d5783b11a74d005c82b11d0f7=
39564976b09ac2a

So, it should work on the meta-erlang master branch. Remember that there is
a specific combination between erlang/elixir that rabbitmq supports. For
that version erlang/otp 27 and elixir 1.18 will work. This is done using
PREFERRED variables.

Regards,

On Fri, Aug 22, 2025 at 12:07=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gma=
il.com>
wrote:

>
>
> On Thu, Aug 21, 2025 at 8:45=E2=80=AFPM Jo=C3=A3o Henrique Ferreira de Fr=
eitas via
> lists.yoctoproject.org <joaohf=3Dgmail.com@lists.yoctoproject.org> wrote:
>
>>
>> Hi,
>>
>> I don't know if this list is the right place to discuss about meta-cloud=
-services/meta-openstack.
>> The README from meta-openstack says here is the place.
>>
>>
> You've got the right place.
>
>
>
>> So, I'm the maintainer of meta-erlang layer and as meta-openstack uses
>> rabbitmq-server from meta-erlang, I should say some words here.
>>
>> I'm planning the following changes on master branch:
>>
>> - rabbitmq-server: update from 3.11.28 to 4.1.3, trying to minimize the
>> number of erlang-modules installed. Because I suspect the rabbitmq-serve=
r
>> recipe is installing too much.
>>
>> - implement some imagetests to test basic rabbitmq features.
>>
>> I want to know if it's ok to meta-openstack users with the plan above.
>> And if 4.1.3 is compatible with the current meta-openstack version.
>>
>
> That's a good plan with me, I haven't done my refreshes on
> meta-cloud-services yet, so I'll have a closer look then. But I don't
> expect any issues.
>
> It was an explicit decision when I removed the erlang bits from the layer=
,
> so I have no concerns following your lead on the version.
>
> Bruce
>
>
>
>>
>> Thanks
>>
>> --
>> Jo=C3=A3o Henrique Ferreira de Freitas - joaohf_at_gmail.com
>> Campinas-SP-Brasil
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#9354):
>> https://lists.yoctoproject.org/g/meta-virtualization/message/9354
>> Mute This Topic: https://lists.yoctoproject.org/mt/114828224/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub =
[
>> bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
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

--=20
Jo=C3=A3o Henrique Ferreira de Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil

--000000000000981aaa063de558ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Bruce,</div><div><br></div><div>Alright, thanks fo=
r your answer.</div><div><br></div><div>I&#39;ve updated rabbitmq recipe:=
=C2=A0<a href=3D"https://github.com/meta-erlang/meta-erlang/commit/d5783b11=
a74d005c82b11d0f739564976b09ac2a">https://github.com/meta-erlang/meta-erlan=
g/commit/d5783b11a74d005c82b11d0f739564976b09ac2a</a></div><div><br></div><=
div>So, it should work on the meta-erlang master branch. Remember that ther=
e is a specific combination between erlang/elixir that rabbitmq supports. F=
or that version erlang/otp 27 and elixir 1.18 will work. This is done using=
 PREFERRED variables.</div><div><br></div><div>Regards,</div></div><br><div=
 class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Fri, Aug 22, 2025 at 12:07=E2=80=AFAM Bruce Ashfield &lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Thu, Aug 21, 2025 at 8:45=E2=80=AFPM Jo=C3=A3o Henrique Ferrei=
ra de Freitas via <a href=3D"http://lists.yoctoproject.org" target=3D"_blan=
k">lists.yoctoproject.org</a> &lt;joaohf=3D<a href=3D"mailto:gmail.com@list=
s.yoctoproject.org" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr"><div><span><span><br></span></span></div><div><span><span>Hi,</=
span></span></div><div><span><span><br></span></span></div><div><span><span=
>I don&#39;t know if this list is the right place to discuss about=C2=A0</s=
pan></span>meta-cloud-services/meta-openstack. The README from meta-opensta=
ck says here is the place.</div><div><br></div></div></blockquote><div><br>=
</div><div><div class=3D"gmail_default" style=3D"font-size:small">You&#39;v=
e got the right place.</div><br></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr"><div></div><div><span><span>=
So, I&#39;m the maintainer of meta-erlang layer and as meta-openstack uses =
rabbitmq-server from meta-erlang, I should say some words here.</span></spa=
n></div><div><span><span><br></span></span></div><div><span><span>I&#39;m p=
lanning the following changes on master branch:</span></span></div><div><sp=
an><span>=C2=A0</span></span></div><div><span><span>- rabbitmq-server: upda=
te from=C2=A0</span></span>3.11.28 to=C2=A04.1.3, trying to minimize the nu=
mber of erlang-modules installed. Because I suspect the rabbitmq-server rec=
ipe is installing too much.</div><div><br></div><div>- implement some image=
tests=C2=A0to test basic rabbitmq features.</div><div><br></div><div>I want=
 to know if it&#39;s ok to meta-openstack users with the plan above. And if=
 4.1.3 is compatible with the current meta-openstack version.</div></div></=
blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-s=
ize:small">That&#39;s a good plan with me, I haven&#39;t done my refreshes =
on meta-cloud-services yet, so I&#39;ll have a closer look then. But I don&=
#39;t expect any issues.</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
It was an explicit decision when I removed the erlang bits from the layer, =
so I have no concerns following your lead on the version.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><br><=
/div><div>Thanks</div><br><span class=3D"gmail_signature_prefix">-- </span>=
<br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">Jo=C3=A3o H=
enrique Ferreira de Freitas - <a href=3D"http://joaohf_at_gmail.com" target=
=3D"_blank">joaohf_at_gmail.com</a><br>Campinas-SP-Brasil</div></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9354): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9354" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9354</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/114828224/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/114828224/1050810</a><br>
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
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Jo=C3=A3o Henrique Ferreira de Freitas - <a href=3D"http://j=
oaohf_at_gmail.com" target=3D"_blank">joaohf_at_gmail.com</a><br>Campinas-S=
P-Brasil</div></div>

--000000000000981aaa063de558ce--

