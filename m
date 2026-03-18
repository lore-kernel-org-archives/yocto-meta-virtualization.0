Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9B610775FC
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 17:35:38 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20133.1773855331406329844
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 18 Mar 2026 10:35:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k20tCcU5;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2adff872068so255975ad.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 18 Mar 2026 10:35:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773855331; cv=none;
        d=google.com; s=arc-20240605;
        b=gMjcUAGJangIbP4+czWGWy1c7JxD4icAOOMOQSReWT3qIXUeSz7AEKzqik6q45KGWX
         LQR0EPDPhijpQIZ9J3wDOM2yD46Gw53J/3SkYi2n6iHt+6oii8Xxy9sv8eGIzh2r2lye
         HSVOA7mLGioj3VB0Imc/xnCvMJVutlqms44xJWmTNEQkDyigWCT5+FjzzzT8K13DF0Vl
         4H+iCl+Egg0WKi5BCenUDGn2zaqKgsqLyRqeHnrvysFYQ38GLXskvXliu/uhUsHZWDKI
         v+3GjGFbk8AU/2ltS8RHshV5P+1bmP9BaGt05pZEp6Azr/neO2scO7rKcaeF0ZZIZg9L
         LDxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ua+z0mgPq7jX3o2LwuzBzBrIvjz9/weQBsEf45nd8fg=;
        fh=3HXlhVEILxrGcGnp1Z03qvqYE2q2IpoRh760A2mo7d8=;
        b=NHNLjGpOb5NyQAW5lhoiMwgftdQm7QbIMGBQbrLAPNAgMDbL7fw6HmmFVdPs0Rs0iu
         m23MEg7YF1uV9TF4NVy18IjamsQeaSItPf0A+kIJuSaOc91w1sjUEVfZH8UZiR42PPlL
         YTLlpDhqIZMIhSwSfwfDbwOD91BrTxfbK8/Rlwf4+SgEVfInT2s1zrpaEmr6G4z0xqWX
         pQoIyO29VR24KjNjZ6hTXZjvolTAmspGgIU1605Lr/uuOcwfi/PN/4Y85MNvF21xiU5U
         uFH3+Wl1mKjUPat1TmpZFU2O+y7LnHtdIKIQxj11Z9o+ZPbPDyiAhDuw6nUzaIGivtBG
         f6zw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773855331; x=1774460131; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ua+z0mgPq7jX3o2LwuzBzBrIvjz9/weQBsEf45nd8fg=;
        b=k20tCcU5qD51YafbErVjQznCJvytojCwU/GlDVSrZ+iUfpOUD0+Kcgwx9A+rI69aeJ
         3pB6/qiPhKmFfopSdDY+leOi7vlMIIj8mk4nUj25NgtBdcG7XbjIQ21Ctn77sFd1u4UW
         sWmPDgjw4fGLRevs9PvXeP/jDQmLUGRoo7CmEqTA/MuJaHgF1AMhgNEMXYnolsISaeox
         8viqDbPpa++Dw8Da88cH2mGRvPNMSVJ20ejoeojWvLD1h24p8QEQKUDOWoAjH6I3gckL
         D/tDq7Ae2P2rYmfs1GA6r01sgfHbA+j3Ls55pJ14f0orKKds3GZ1BsPEg/c5Uf6OV0Yn
         SMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773855331; x=1774460131;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ua+z0mgPq7jX3o2LwuzBzBrIvjz9/weQBsEf45nd8fg=;
        b=mepB//+ec0fKfcnaWffk3FVxt2BXvI6utLHB1D+Q7Nad1/sMXoj00l6Lgc54ZuE9Kp
         N9Zdw7KLjXpbkJ2yILy6Wh07V5zxk46KElWHYUb0EzAIVtYA519ylv4hggIzXjx9sBn+
         oAf9hRzTpUvESxNFQeQ85nD+zq0N40v5PwVJt6rX/I987DWXfRuTUu5tcb5cLBtNE42S
         XGLBz3EgyQegCoP1axKASoMEJmvMO6pX/MZ1kcjmHmN47QDZrlFVM4DPl8+VbXSPS7oJ
         im+rW92wnm9e4msx27f51xDlbOFk2vtHZORUcZ8kGgg1tlcyLV1ur8RBfQZDCBdQ7uc3
         tYnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXgL9qRmUMujK9i1oIhLT9p5nYrs5N+TCCEpzc3CDOHVHqHnB5tamYnzTvJyiL/X9Yr8VGD8Qg51FKY0S9nglzjq3j@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwCVMb7e829xOwPZz+I5jcmJSUVcJHYg3dz1heY7LYMkjU8oirl
	ii3xgAQFeJ2qjSpMoV3D5hzP7ISoE82/DwIFN7Nw97KHh3dYLTZXMRdXlYJjN/QJOiliwSn6gwV
	N670GfD0yW23kKmrcsy6mjpELg0eKpKA=
X-Gm-Gg: ATEYQzyF/mn1ATq9VwDK/anzKHGOYUMiTvYDRr2hfxpiL7xqhk5VsnvxehxxY8xQGHN
	493vISBvu/3pBTfaNi1SNlAA9g2o8vRR0y4HRKIfH8rKAxEDZ+2sw48xr09BywC/Z3nQr/8+t9N
	pTEOls9vYf14F6kp75ikCskVwu9dSPW/3qrwoCwm2c2rOuBCZBZ6Jg1Skz9Et8fIPdzFZOsUtvA
	Mbv966xXk4/iao7GV3MvtESLI42UGwtZJk4VF/3Dc2NatrY9lJtwD5lpxPl1mVlie89aIamXunr
	UDG69JRxZYJK+fgb1Mfjj5dsEXFjtca8QLE+ZWpJ
X-Received: by 2002:a17:902:e841:b0:2b0:4ec8:fb8f with SMTP id
 d9443c01a7336-2b06e3cbc08mr49543995ad.40.1773855330560; Wed, 18 Mar 2026
 10:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_5yosWgnNzyVw0QJ=cAsaOG-1-mc6T3=jE+82G9WO7wD2v6Q@mail.gmail.com>
 <189B097EDA1BDF04.2292097@lists.yoctoproject.org> <189B09A6A12322EF.2292097@lists.yoctoproject.org>
In-Reply-To: <189B09A6A12322EF.2292097@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 18 Mar 2026 13:35:18 -0400
X-Gm-Features: AaiRm53FpA_McfO3Uwtt-lvTswSeROcpMwT4tbXSqdK1nfC5kEkB2-m2Zyz5eyM
Message-ID: <CADkTA4ORQCkQNyz6jTezYJuYD_Wf3Gkh250hYjr5pP+hDnW3FA@mail.gmail.com>
Subject: Re: [meta-virtualization] GO_MOD_FETCH_MODE vcs broken due invalid tags
To: bruce.ashfield@gmail.com
Cc: ricardo.salveti@oss.qualcomm.com, 
	meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000dc6f36064d4fe061"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 18 Mar 2026 17:35:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9667

--000000000000dc6f36064d4fe061
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 8, 2026 at 9:58=E2=80=AFPM Bruce Ashfield via lists.yoctoprojec=
t.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:

>
>
> On Sun, Mar 8, 2026 at 9:55=E2=80=AFPM Bruce Ashfield via lists.yoctoproj=
ect.org
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
>>
>>
>> On Sun, Mar 8, 2026 at 2:57=E2=80=AFPM Ricardo Salveti via lists.yoctopr=
oject.org
>> <ricardo.salveti=3Doss.qualcomm.com@lists.yoctoproject.org> wrote:
>>
>>> Hi,
>>>
>>> I was trying to build docker-compose with GO_MOD_FETCH_MODE set to vcs
>>> today and it fails to build due duplicated entries pointing to the
>>> same tag but with different commit revisions (failed on fetch). This
>>> seems to be caused by
>>>
>>> https://git.yoctoproject.org/meta-virtualization/commit/scripts?id=3Ddb=
f720ccb0519a4dbf143dbaed1633527b8d7b60
>>> and you can see the problematic diff done as part of
>>>
>>> https://git.yoctoproject.org/meta-virtualization/commit/recipes-contain=
ers/docker-compose?id=3D56a7b72a93fd20d9c21ecdc45487a888b76d194c
>>> :
>>>
>>> +SRC_URI +=3D "git://
>>> go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shal=
low=3D1;rev=3D33540a1f603772f9d4b761f416f5c10dade23e96;name=3Dgit_da0444fc_=
1;destsuffix=3Dvcs_cache/74df1e05ff5bf1317fe42883ce7a496c0ad3800044d955163f=
d3f3acca0a0166
>>> "
>>> +SRC_URI +=3D "git://
>>> go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shal=
low=3D1;rev=3D33da011f77ade50ff5b6a6fb4a9a1e6d6b285809;name=3Dgit_da0444fc_=
2;destsuffix=3Dvcs_cache/144d2f77c6aa06af51d5820df4e7506c5ecad01c86e770e002=
7b682ff0d3f9a9
>>> "
>>> +SRC_URI +=3D "git://
>>> go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shal=
low=3D1;rev=3D43e1dd70ce54ee5b1711930029ae5b4926f78f72;name=3Dgit_da0444fc_=
3;destsuffix=3Dvcs_cache/61395547cb668a679b4d7508a904d02fd50ffe1630e5ffd6f4=
ef293a97c2d3ba
>>> "
>>> +SRC_URI +=3D "git://
>>> go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shal=
low=3D1;rev=3D59db8d763f22395595c26ee1cae0886b57141b3a;name=3Dgit_da0444fc_=
4;destsuffix=3Dvcs_cache/34a6c6ff0efd234ebc0cc2a5cfdad07405fca7403da460f8d2=
5bfb69091bc0c5
>>> "
>>> +SRC_URI +=3D "git://
>>> go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shal=
low=3D1;rev=3D5ac8a444bdc56cee774f8f2b3382156bd27c63c3;name=3Dgit_da0444fc_=
5;destsuffix=3Dvcs_cache/fefde8e557c698aecc8d48f3c3d82b7fea1eb55451adbc71db=
ed3a8871ed8e13
>>> "
>>> +SRC_URI +=3D "git://
>>> go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shal=
low=3D1;rev=3D665e8c7367d1ecf644cea2d163019ef59c13d554;name=3Dgit_da0444fc_=
6;destsuffix=3Dvcs_cache/7389e79775019a8b50e34efbdfd1a6f9ee910ef3822e04963b=
a444b3d04db399
>>> "
>>> +SRC_URI +=3D "git://
>>> go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shal=
low=3D1;rev=3D8c9f86f7a55f5af45a9080f6ed3ac915382d369c;name=3Dgit_da0444fc_=
7;destsuffix=3Dvcs_cache/2b23297aec08f23623501029a20a4eee604e87ce090001ef6a=
d0a5930d799dd5
>>> "
>>>
>>> They are all pointing to the v0.3.0 tag, but all using different git
>>> revisions, which will cause fetcher to fail. I tried to have a quick
>>> look into the go mod fetcher but wasn't able to quickly identify a fix
>>> there.
>>>
>>
>> This was already reported, but I can't reproduce the failure.
>>
>
> oh, this is with the pure vcs, and not the hybrid / default mode
>

I had most of these already fixed, but I just went through the update
of docker-compose and I tested the vcs build. There was one remaining
issue.

I've fixed the discovery bbclass and updated the recipe. It builds in both
hybrid and vcs mode now.

Everything is on master-next.

Bruce



>
> This was reported, I have a fix, I'll regenerate the recipes in this
> update cycle and
> that should fix things up.
>
> Bruce
>
>
>
>>
>> Obviously if I wasn't building and testing it, it wouldn't be in the tre=
e.
>>
>> Bruce
>>
>>
>>
>>>
>>> Example of the failure:
>>>
>>> ERROR: docker-compose-v5.0.0-r0 do_unpack: Bitbake Fetcher Error:
>>> FetchError("The revision the git tag 'v0.3.0' resolved to didn't match
>>> the SRCREV in use (97ca0e3821bf3a3cf6ea2441ece139e524802385 vs
>>> 03fcf44c2211dcd5eb77510b5f7c1fb02d6ded50)",
>>> 'git://
>>> go.googlesource.com/term;protocol=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;sha=
llow=3D1;rev=3D03fcf44c2211dcd5eb77510b5f7c1fb02d6ded50;name=3Dgit_2e975dd2=
_0;destsuffix=3Dvcs_cache/39b5e1daf17afc894da71452dbc3a21bfd60c2a69143fd621=
e2f4c38e90360ea
>>> ')
>>> ERROR: Logfile of failure stored in:
>>>
>>> /home/rsalveti/build/lmp-next/build-lmp/tmp-lmp/work/corei7-64-lmp-linu=
x/docker-compose/v5.0.0/temp/log.do_unpack.7110
>>> ERROR: Task
>>> (/home/rsalveti/build/lmp-next/build-lmp/conf/../../layers/meta-virtual=
ization/recipes-containers/docker-compose/
>>> docker-compose_git.bb:do_unpack)
>>> failed with exit code '1'
>>>
>>> Other recipes probably have similar issues.
>>>
>>> Thanks,
>>>
>>> Ricardo
>>>
>>>
>>>
>>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
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
> View/Reply Online (#9627):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9627
> Mute This Topic: https://lists.yoctoproject.org/mt/118208278/1050810
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

--000000000000dc6f36064d4fe061
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Mar 8, 2026 at 9:58=
=E2=80=AFPM Bruce Ashfield via <a href=3D"http://lists.yoctoproject.org">li=
sts.yoctoproject.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@l=
ists.yoctoproject.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v dir=3D"ltr"><div style=3D"font-size:small"><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Mar 8, 2026 =
at 9:55=E2=80=AFPM Bruce Ashfield via <a href=3D"http://lists.yoctoproject.=
org" target=3D"_blank">lists.yoctoproject.org</a> &lt;bruce.ashfield=3D<a h=
ref=3D"mailto:gmail.com@lists.yoctoproject.org" target=3D"_blank">gmail.com=
@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font=
-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Sun, Mar 8, 2026 at 2:57=E2=80=AFPM Ricardo Salve=
ti via <a href=3D"http://lists.yoctoproject.org" target=3D"_blank">lists.yo=
ctoproject.org</a> &lt;ricardo.salveti=3D<a href=3D"mailto:oss.qualcomm.com=
@lists.yoctoproject.org" target=3D"_blank">oss.qualcomm.com@lists.yoctoproj=
ect.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Hi,<br>
<br>
I was trying to build docker-compose with GO_MOD_FETCH_MODE set to vcs<br>
today and it fails to build due duplicated entries pointing to the<br>
same tag but with different commit revisions (failed on fetch). This<br>
seems to be caused by<br>
<a href=3D"https://git.yoctoproject.org/meta-virtualization/commit/scripts?=
id=3Ddbf720ccb0519a4dbf143dbaed1633527b8d7b60" rel=3D"noreferrer" target=3D=
"_blank">https://git.yoctoproject.org/meta-virtualization/commit/scripts?id=
=3Ddbf720ccb0519a4dbf143dbaed1633527b8d7b60</a><br>
and you can see the problematic diff done as part of<br>
<a href=3D"https://git.yoctoproject.org/meta-virtualization/commit/recipes-=
containers/docker-compose?id=3D56a7b72a93fd20d9c21ecdc45487a888b76d194c" re=
l=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/meta-virtua=
lization/commit/recipes-containers/docker-compose?id=3D56a7b72a93fd20d9c21e=
cdc45487a888b76d194c</a>:<br>
<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/sys;protoco=
l=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shallow=3D1;rev=3D33540a1f603772f9d4b76=
1f416f5c10dade23e96;name=3Dgit_da0444fc_1;destsuffix=3Dvcs_cache/74df1e05ff=
5bf1317fe42883ce7a496c0ad3800044d955163fd3f3acca0a0166" rel=3D"noreferrer" =
target=3D"_blank">go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=
=3Dv0.3.0;shallow=3D1;rev=3D33540a1f603772f9d4b761f416f5c10dade23e96;name=
=3Dgit_da0444fc_1;destsuffix=3Dvcs_cache/74df1e05ff5bf1317fe42883ce7a496c0a=
d3800044d955163fd3f3acca0a0166</a>&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/sys;protoco=
l=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shallow=3D1;rev=3D33da011f77ade50ff5b6a=
6fb4a9a1e6d6b285809;name=3Dgit_da0444fc_2;destsuffix=3Dvcs_cache/144d2f77c6=
aa06af51d5820df4e7506c5ecad01c86e770e0027b682ff0d3f9a9" rel=3D"noreferrer" =
target=3D"_blank">go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=
=3Dv0.3.0;shallow=3D1;rev=3D33da011f77ade50ff5b6a6fb4a9a1e6d6b285809;name=
=3Dgit_da0444fc_2;destsuffix=3Dvcs_cache/144d2f77c6aa06af51d5820df4e7506c5e=
cad01c86e770e0027b682ff0d3f9a9</a>&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/sys;protoco=
l=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shallow=3D1;rev=3D43e1dd70ce54ee5b17119=
30029ae5b4926f78f72;name=3Dgit_da0444fc_3;destsuffix=3Dvcs_cache/61395547cb=
668a679b4d7508a904d02fd50ffe1630e5ffd6f4ef293a97c2d3ba" rel=3D"noreferrer" =
target=3D"_blank">go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=
=3Dv0.3.0;shallow=3D1;rev=3D43e1dd70ce54ee5b1711930029ae5b4926f78f72;name=
=3Dgit_da0444fc_3;destsuffix=3Dvcs_cache/61395547cb668a679b4d7508a904d02fd5=
0ffe1630e5ffd6f4ef293a97c2d3ba</a>&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/sys;protoco=
l=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shallow=3D1;rev=3D59db8d763f22395595c26=
ee1cae0886b57141b3a;name=3Dgit_da0444fc_4;destsuffix=3Dvcs_cache/34a6c6ff0e=
fd234ebc0cc2a5cfdad07405fca7403da460f8d25bfb69091bc0c5" rel=3D"noreferrer" =
target=3D"_blank">go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=
=3Dv0.3.0;shallow=3D1;rev=3D59db8d763f22395595c26ee1cae0886b57141b3a;name=
=3Dgit_da0444fc_4;destsuffix=3Dvcs_cache/34a6c6ff0efd234ebc0cc2a5cfdad07405=
fca7403da460f8d25bfb69091bc0c5</a>&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/sys;protoco=
l=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shallow=3D1;rev=3D5ac8a444bdc56cee774f8=
f2b3382156bd27c63c3;name=3Dgit_da0444fc_5;destsuffix=3Dvcs_cache/fefde8e557=
c698aecc8d48f3c3d82b7fea1eb55451adbc71dbed3a8871ed8e13" rel=3D"noreferrer" =
target=3D"_blank">go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=
=3Dv0.3.0;shallow=3D1;rev=3D5ac8a444bdc56cee774f8f2b3382156bd27c63c3;name=
=3Dgit_da0444fc_5;destsuffix=3Dvcs_cache/fefde8e557c698aecc8d48f3c3d82b7fea=
1eb55451adbc71dbed3a8871ed8e13</a>&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/sys;protoco=
l=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shallow=3D1;rev=3D665e8c7367d1ecf644cea=
2d163019ef59c13d554;name=3Dgit_da0444fc_6;destsuffix=3Dvcs_cache/7389e79775=
019a8b50e34efbdfd1a6f9ee910ef3822e04963ba444b3d04db399" rel=3D"noreferrer" =
target=3D"_blank">go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=
=3Dv0.3.0;shallow=3D1;rev=3D665e8c7367d1ecf644cea2d163019ef59c13d554;name=
=3Dgit_da0444fc_6;destsuffix=3Dvcs_cache/7389e79775019a8b50e34efbdfd1a6f9ee=
910ef3822e04963ba444b3d04db399</a>&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/sys;protoco=
l=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shallow=3D1;rev=3D8c9f86f7a55f5af45a908=
0f6ed3ac915382d369c;name=3Dgit_da0444fc_7;destsuffix=3Dvcs_cache/2b23297aec=
08f23623501029a20a4eee604e87ce090001ef6ad0a5930d799dd5" rel=3D"noreferrer" =
target=3D"_blank">go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=
=3Dv0.3.0;shallow=3D1;rev=3D8c9f86f7a55f5af45a9080f6ed3ac915382d369c;name=
=3Dgit_da0444fc_7;destsuffix=3Dvcs_cache/2b23297aec08f23623501029a20a4eee60=
4e87ce090001ef6ad0a5930d799dd5</a>&quot;<br>
<br>
They are all pointing to the v0.3.0 tag, but all using different git<br>
revisions, which will cause fetcher to fail. I tried to have a quick<br>
look into the go mod fetcher but wasn&#39;t able to quickly identify a fix<=
br>
there.<br></blockquote><div><br></div><div><div style=3D"font-size:small">T=
his was already reported, but I can&#39;t reproduce the failure.</div></div=
></div></div></blockquote><div><br></div><div><div style=3D"font-size:small=
">oh, this is with the pure vcs, and not the hybrid=C2=A0/ default mode</di=
v></div></div></div></blockquote><div><br></div><div><div class=3D"gmail_de=
fault" style=3D"font-size:small">I had most of these already fixed, but I j=
ust went through the update</div><div class=3D"gmail_default" style=3D"font=
-size:small">of docker-compose and I tested the vcs build. There was one re=
maining</div><div class=3D"gmail_default" style=3D"font-size:small">issue.<=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">I&#39;ve fixed the discov=
ery bbclass and updated the recipe. It builds in both</div><div class=3D"gm=
ail_default" style=3D"font-size:small">hybrid and vcs mode now.</div><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">Everything is on master-next.</div><=
div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div class=3D"gmail_quote"><div><div style=3D"font-size:small"><br></div><=
div style=3D"font-size:small">This was reported, I have a fix, I&#39;ll reg=
enerate the recipes in this update cycle and</div><div style=3D"font-size:s=
mall">that should fix things up.</div><div style=3D"font-size:small"><br></=
div><div style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><div><div style=3D"font-size:small"><br></div><div style=
=3D"font-size:small">Obviously if I wasn&#39;t building and testing it, it =
wouldn&#39;t be in the tree.</div><div style=3D"font-size:small"><br></div>=
<div style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
<br>
Example of the failure:<br>
<br>
ERROR: docker-compose-v5.0.0-r0 do_unpack: Bitbake Fetcher Error:<br>
FetchError(&quot;The revision the git tag &#39;v0.3.0&#39; resolved to didn=
&#39;t match<br>
the SRCREV in use (97ca0e3821bf3a3cf6ea2441ece139e524802385 vs<br>
03fcf44c2211dcd5eb77510b5f7c1fb02d6ded50)&quot;,<br>
&#39;git://<a href=3D"http://go.googlesource.com/term;protocol=3Dhttps;nobr=
anch=3D1;tag=3Dv0.3.0;shallow=3D1;rev=3D03fcf44c2211dcd5eb77510b5f7c1fb02d6=
ded50;name=3Dgit_2e975dd2_0;destsuffix=3Dvcs_cache/39b5e1daf17afc894da71452=
dbc3a21bfd60c2a69143fd621e2f4c38e90360ea" rel=3D"noreferrer" target=3D"_bla=
nk">go.googlesource.com/term;protocol=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;sha=
llow=3D1;rev=3D03fcf44c2211dcd5eb77510b5f7c1fb02d6ded50;name=3Dgit_2e975dd2=
_0;destsuffix=3Dvcs_cache/39b5e1daf17afc894da71452dbc3a21bfd60c2a69143fd621=
e2f4c38e90360ea</a>&#39;)<br>
ERROR: Logfile of failure stored in:<br>
/home/rsalveti/build/lmp-next/build-lmp/tmp-lmp/work/corei7-64-lmp-linux/do=
cker-compose/v5.0.0/temp/log.do_unpack.7110<br>
ERROR: Task (/home/rsalveti/build/lmp-next/build-lmp/conf/../../layers/meta=
-virtualization/recipes-containers/docker-compose/<a href=3D"http://docker-=
compose_git.bb" target=3D"_blank">docker-compose_git.bb</a>:do_unpack)<br>
failed with exit code &#39;1&#39;<br>
<br>
Other recipes probably have similar issues.<br>
<br>
Thanks,<br>
<br>
Ricardo<br>
<br>
<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>
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
View/Reply Online (#9627): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9627" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9627</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/118208278/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/118208278/1050810</a><br>
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

--000000000000dc6f36064d4fe061--

