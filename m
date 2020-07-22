Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web10.15213.1595410147981335102
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 22 Jul 2020 02:29:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h9eR0y4A;
 spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: siddhuvgowda.18695@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id q3so694573ilt.8
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 22 Jul 2020 02:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=bR+0IVhTU8gSkI3M/ZP1V/3gTzR8+z/QvGZtF+fdtgc=;
        b=h9eR0y4AyynuyYAJN0VW0ywxyXXPWE0Cji7nkNPnzwVgiMykBRyZBsQhwhqBqUuKWf
         6VYLyWIpSH0NcJ/AFyMgVooAYQrBpK7BcjIsnv7ckb/13iWPJNQuhHT9jHgmjdW6Q21F
         wq4dBtkRZKYs3T+wuicOoVzMDH9/9SNNIIM+I4X3J+IqXNgw/KLfmas00jDSWkGd21Yb
         zm4fLt6oOi5arsx3UxC1QGGBQ7WRKbwfEwhFsDWeupVJxpXjyzZ/guOr8DgE9FnZq77L
         cWhCB07Qn8sR9QZgr1nWvfrfwLDFwwrbWpg8AD8LS5TmHfHxBht5IpqUvLTaEjmMCxM/
         BP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=bR+0IVhTU8gSkI3M/ZP1V/3gTzR8+z/QvGZtF+fdtgc=;
        b=UjofdSRKb7e0wPLu1QZinuHwiqTKYwKDyCAhy2oaxPSOZXc0MBGVlI8iTLj/OcJifv
         Z9UnX00Tmk7k56DavIc2VUPJryqOc5wIQNoYZaXZYnVCPhMnMfQcDhIyxnzAYFkzoqpy
         bhymYwxCajidX9JRE3BOQPcqV94BMP1FZLsn4ofTjd8GlBCAVCkhZ2gbhvUO51qgjLqk
         b3iPN5k22nqguDRENjAV0ctxuHQng6JSpofe/wvTaykGm947Rt236eVTka3CXgABTUIj
         J/GDCxMMX+rWg4r9je5TgeCGBF9MzqIYQ4oW3PEmafSEi5+2JrTJ1NAi6VUHO0sVYklu
         ry2g==
X-Gm-Message-State: AOAM533EMLIywRAge7E8DiU84VPOxq7VeHvozwmTE5JPefj8qxFx8oNi
	BttXMJRQcOSxxEgMGskUKYhkrOCxTY+6FXlV9cqaHw==
X-Google-Smtp-Source: ABdhPJwRP4aJQbFARB/KRVzIMJQk/rRynhqTLMpwXXnxEgomoQCegG3qiKODjC7pioJ5ffo5SiAGF2fxyAOJ4UZTiMA=
X-Received: by 2002:a92:8585:: with SMTP id f127mr31820281ilh.207.1595410147202;
 Wed, 22 Jul 2020 02:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAEkELtD4H=icOxXrPcqsNCgzpdyQhDtgshvU6Bp6njCNN44SCw@mail.gmail.com>
 <4148.1595392395745845677@lists.yoctoproject.org> <CAEkELtD3Jz66XQW2JYE3i7tBT0wptxYeh6h8QuVt0fvXovKbrQ@mail.gmail.com>
 <CAP2Ojcjhg-14ub3puC3q06rmUjv90rBFP8SZkTZDdP0xgUWbqg@mail.gmail.com>
 <CAEkELtBn00Ho-vMj-XAY09DabvCNBC7D5H8g9OL1yb3TPTr-dQ@mail.gmail.com> <CAP2OjchB-u6fPPF_8WJy9kknT8mewymfCjP0BK8Wk3sqAzAsuA@mail.gmail.com>
In-Reply-To: <CAP2OjchB-u6fPPF_8WJy9kknT8mewymfCjP0BK8Wk3sqAzAsuA@mail.gmail.com>
From: "Siddhartha V" <Siddhuvgowda.18695@gmail.com>
Date: Wed, 22 Jul 2020 14:58:55 +0530
Message-ID: <CAEkELtBMdM-V6OGn5TGXE_3L57QSAa_3ZagpWUC8xUWh4wcZkw@mail.gmail.com>
Subject: Re: [meta-virtualization] Starting Xen guest on Raspberry-Pi4. #meta-virtualization #yocto
To: Ashish Mishra <ashishm@mvista.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000185d0205ab045fbb"

--000000000000185d0205ab045fbb
Content-Type: text/plain; charset="UTF-8"

Sure sir, Thank you



--
Thanks and Regards.
Siddhartha V.



On Wed, Jul 22, 2020 at 11:28 AM Ashish Mishra <ashishm@mvista.com> wrote:

> Yes .
> -  Also please keep the communication via group reply & on forum.
>
> - We should prefer group reply on forums compared to private communication.
>    As that can help others in future.
>    ( i missed sending as group reply & accidentally sent only to you )
>
> Thanks,
> Ashish
>
>
>
>
>
> On Wed, Jul 22, 2020 at 11:04 AM siddhartha v <
> siddhuvgowda.18695@gmail.com> wrote:
>
>> Thank you sir.
>>
>>
>> File path is that you shared in last mail right naa sir.
>>
>> On Wed, 22 Jul, 2020, 10:34 AM Ashish Mishra, <ashishm@mvista.com> wrote:
>>
>>> Siddartha ,
>>>
>>> 1) cd to meta-virtualization
>>>
>>> 2) git apply --check  <path-of-patch-file>
>>>     This can help you to check if the patch is proper or there is some
>>> error.
>>>
>>> 3) If step-2 doesn't give an error try
>>>     git am <path-of-patch-file>
>>>
>>> Thanks ,
>>> Ashish
>>>
>>>
>>>
>>>
>>> On Wed, Jul 22, 2020 at 10:27 AM siddhartha v <
>>> siddhuvgowda.18695@gmail.com> wrote:
>>>
>>>> Thank tou ashish sir,
>>>>
>>>> Ok i will sure follow your instructions.
>>>>
>>>> Also I am newbie and wrking on this linux, and all for the first time.
>>>> don't know how to apply patches.
>>>>
>>>> Can you please help me out how can I apply patches on
>>>> meta-virtualization.
>>>>
>>>> kind request sir.
>>>>
>>>> Regards,
>>>> Siddhartha V
>>>>
>>>> On Wed, 22 Jul, 2020, 10:03 AM Ashish, <ashishm@mvista.com> wrote:
>>>>
>>>>> Hi Siddharth ,
>>>>>
>>>>> 1) With inputs from Christopher (@ https://lists.yoctoproject.org/g/meta-virtualization/message/5464
>>>>> )  <https://lists.yoctoproject.org/g/meta-virtualization/message/5464>
>>>>>     we can generate an Xen image with kernel 5.4 following  :
>>>>>       poky: 18b6b2ae819cbf0ef3858944b4cd02ab74df6607
>>>>> meta-openembedded: 463f9a3ef0935d772a0be0437a8c09df64ed2f07
>>>>> meta-raspberrypi: 5576a22061864bc451ec4fcacb7d830bf76b7ebd
>>>>> meta-virtualization: d75bc448866d2b36779251efb1310d0234ece30b
>>>>>
>>>>> 2) On top of meta-virtualization , apply the patches from series
>>>>> Patch[00/10] Xen on Raspberry Pi 4 series
>>>>> You can extract these patches from Christopher's repo @
>>>>> https://github.com/dozylynx/meta-virtualization
>>>>>
>>>>> 3) Configure your local.conf file for rpi-4 architecture
>>>>> Example from mine :- 271 QEMU_TARGETS ="i386 x86_64 aarch64 arm" 272
>>>>> DISTRO_FEATURES_append = " xen virtualization" 273 MACHINE =
>>>>> "raspberrypi4-64" 274 DL_DIR =
>>>>> "/home/ashish/Downloads/poky-tar-files"
>>>>> 4) Generate an image by
>>>>>               $ bitbake -k xen-image-minimal
>>>>>
>>>>> This should give you an working dom0 image
>>>>> Hope this helps ! 
>>>>>
>>>>

--000000000000185d0205ab045fbb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sure sir, Thank you<br clear=3D"all"><div><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr"><div><br></div><div><br></div><div><br></div><div>--</div><div>Thanks a=
nd Regards.</div>Siddhartha V.<div>=C2=A0</div></div></div></div><br></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed=
, Jul 22, 2020 at 11:28 AM Ashish Mishra &lt;<a href=3D"mailto:ashishm@mvis=
ta.com">ashishm@mvista.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr">Yes .<div>-=C2=A0 Also please ke=
ep the communication via group reply &amp; on forum.=C2=A0</div><div><br></=
div><div>- We should prefer group reply on forums compared to private commu=
nication.</div><div><div>=C2=A0 =C2=A0As that can help others in future.=C2=
=
=A0</div><div></div></div><div>=C2=A0 =C2=A0( i missed sending as group re=
ply &amp; accidentally=C2=A0sent only to you )</div><div><br></div><div>Tha=
nks,</div><div>Ashish=C2=A0</div><div><br></div><div><br></div><div><br></d=
iv><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Wed, Jul 22, 2020 at 11:04 AM siddhartha v &lt;<a href=
=
=3D"mailto:siddhuvgowda.18695@gmail.com" target=3D"_blank">siddhuvgowda.18=
695@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"auto">Thank you sir.<div dir=3D"auto"><br></div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">File path is that you shared in=
 last mail right naa sir.=C2=A0</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Wed, 22 Jul, 2020, 10:34 AM Ashish =
Mishra, &lt;<a href=3D"mailto:ashishm@mvista.com" target=3D"_blank">ashishm=
@mvista.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr">Siddartha ,<div><br></div><div>1) cd to meta-v=
irtualization=C2=A0</div><div><br></div><div>2)=C2=A0git apply --check=C2=
=A0 &lt;path-of-patch-file&gt;</div><div>=C2=A0 =C2=A0 This can help you t=
o check if the patch=C2=A0is proper or there is some error.</div><div><br><=
/div><div>3) If step-2 doesn&#39;t give an error try=C2=A0</div><div>=C2=A0=
 =C2=A0 git am &lt;path-of-patch-file&gt;</div><div><br></div><div>Thanks ,=
</div><div>Ashish=C2=A0</div><div><br></div><div><br></div><div><br></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Wed, Jul 22, 2020 at 10:27 AM siddhartha v &lt;<a href=3D"mailto:siddhuvg=
owda.18695@gmail.com" rel=3D"noreferrer" target=3D"_blank">siddhuvgowda.186=
95@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"auto">Thank tou ashish sir,<div dir=3D"auto"><br></=
div><div dir=3D"auto">Ok i will sure follow your=C2=A0instructions.=C2=A0</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Also I am newbie and wrki=
ng on this linux, and all for the first time. don&#39;t know how to apply p=
atches.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Can you please h=
elp me out how can I apply patches on meta-virtualization.=C2=A0</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">kind request sir.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Regards,=C2=A0</div><div dir=3D"auto">Si=
ddhartha V=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Wed, 22 Jul, 2020, 10:03 AM Ashish, &lt;<a href=3D=
"mailto:ashishm@mvista.com" rel=3D"noreferrer" target=3D"_blank">ashishm@mv=
ista.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Hi Siddharth ,<br><br>1) With inputs from=C2=A0<span style=3D"white=
-space:pre-wrap">Christopher</span>=C2=A0(@=C2=A0<a href=3D"https://lists.y=
octoproject.org/g/meta-virtualization/message/5464" rel=3D"noreferrer noref=
errer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-virtualizati=
on/message/5464 )=C2=A0</a><br>=C2=A0 =C2=A0 we can generate an Xen image w=
ith kernel 5.4 following=C2=A0 :<br>=C2=A0 =C2=A0 =C2=A0=C2=A0<span style=
=3D"white-space:pre-wrap">poky: 18b6b2ae819cbf0ef3858944b4cd02ab74df6607</=
span><br style=3D"white-space:pre-wrap"><span style=3D"white-space:pre-wrap=
"> meta-openembedded: 463f9a3ef0935d772a0be0437a8c09df64ed2f07</span><br st=
yle=3D"white-space:pre-wrap"><span style=3D"white-space:pre-wrap"> meta-ras=
pberrypi: 5576a22061864bc451ec4fcacb7d830bf76b7ebd</span><br style=3D"white=
-space:pre-wrap"><span style=3D"white-space:pre-wrap"> meta-virtualization:=
 d75bc448866d2b36779251efb1310d0234ece30b<br><br>2) On top of </span><span =
style=3D"white-space:pre-wrap">meta-virtualization , apply the patches from=
 series Patch[00/10] Xen on Raspberry Pi 4 series<br></span><span style=3D"=
white-space:pre-wrap"> You can extract these patches from Christopher&#39;s=
 repo @ </span><a href=3D"https://github.com/dozylynx/meta-virtualization" =
rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/dozylynx=
/meta-virtualization</a><span style=3D"white-space:pre-wrap"><br></span><br=
><span style=3D"white-space:pre-wrap">3) Configure your local.conf file for=
 rpi-4 architecture </span><br><span style=3D"white-space:pre-wrap"> Exampl=
e from mine :- 271 QEMU_TARGETS =3D&quot;i386 x86_64 aarch64 arm&quot; </sp=
an><span style=3D"white-space:pre-wrap"> </span><span style=3D"white-space:=
pre-wrap">272 DISTRO_FEATURES_append =3D &quot; xen virtualization&quot; </=
span><span style=3D"white-space:pre-wrap"> </span><span style=3D"white-spac=
e:pre-wrap">273 MACHINE =3D &quot;raspberrypi4-64&quot; </span><span style=
=3D"white-space:pre-wrap"> </span><span style=3D"white-space:pre-wrap">274=
 DL_DIR =3D &quot;/home/ashish/Downloads/poky-tar-files&quot; </span><br>4)=
 Generate an image by=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 $ bitbake -k xen-image-minimal=C2=A0<br><br>This should give you an=
 working dom0 image=C2=A0<br>Hope this helps !
<br>
</blockquote></div>
</blockquote></div>
</blockquote></div>
</blockquote></div>
</blockquote></div>
<br>-- <br>Best Regards,<br />Siddhartha V

--000000000000185d0205ab045fbb--
