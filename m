Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26BFBEA854C
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 01:58:19 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5195.1773021489454914537
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 08 Mar 2026 18:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kJHlHNVf;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c70c112cb61so6125764a12.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 08 Mar 2026 18:58:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773021489; cv=none;
        d=google.com; s=arc-20240605;
        b=KkEEQVkxB1s1CVpGj8KCpaXznoaGg7uvUJykESdSrVyLYQ+EpyQSAMh94A+EeVbs8Z
         GDhCU903mghT/FoM04XMNWBxnlRBtaG9m98i/DkmkOMldTdT5n2nJwY0FI/eC4c1BGSW
         Ok/jHtA4uDjfw1jHlrrAHNs41rg3IBRXf9MTmHKy5cxBYgrJoYcTr1WhHKbRY4BEAEy3
         xCWj+mMRJ/HP3sSmYRiFPvNqxri8tbEsgBouLzscwoXWoo23mmWwGtrIsZSwRSYbH+BV
         4fJgIWVgQWSHQ0zc0WpxL1FjDNhg6Aadmosv5oBNQKGHZOlJhO/s8mdtexUSYcfHPX+K
         QK7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yisBVVL9I5sy6boWcRn9eg7S+T5yb0wcquHxTfd6/Ak=;
        fh=pVw335vR+XD9E1xlBoka8ciBgByWY6BPjhQVmaCbSiA=;
        b=Sah0jBLr1JIYADdszFzpvCp3TTkIgBCbjy5kq0DWGf9EIF+hyJXSezYVGpu+OWR4Aw
         g2EGm37r7NCWOlGcamdLnlJ+kxvhEcs9c/eDWpvYl7a7x8JPWqlIRLDGcPqwFa+U15b/
         t/KvOJDu3M5zs/uWPLWqEYmCORij6a7NCCcW/OMxSrNXN2DasZ4I62DWLY0Ha9dMxeeA
         LjzUCMtEirHAVowRty1lgQjgBabMFEHD+t7SN0VGYqqULAufhRCo0reIyJe5UbvW4PRW
         UIh3cRSj+2ZdxDLtYyuoLjxQEQ62hA+hxDRvm6OvoMT4dVs/Qph8ngpY/+C4hTFo6mef
         Ljbw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773021489; x=1773626289; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yisBVVL9I5sy6boWcRn9eg7S+T5yb0wcquHxTfd6/Ak=;
        b=kJHlHNVfmVv60/vIZ2RCd9nyFFe3itzFuMjNJvgwVTq3EQCFDHkOG1r03jGIg05/H2
         g9p1D1zGF7EWNzqDo4ixKV/1xvuby/eNyOa0uBlu+q1ym6Jgvd2YnrzzQZptrWYXRjtC
         Qk65Cv0cCUZXW/OrFk4bgtUYWYdzk6zRml+5+ZPumVxMdO0/9umEmvFyobOvK56Vve+F
         7EOveGzxnjZtk/2OmKufWMsnB18oAKFnP/RmLBz9kYe8T/bMMEd/8ltLIiHvklZSkdgg
         ooDOkRUIklFElEvuwcfsdOKqAnnYzfGXlb3lj/P7Fmm/bQimj3WCdAyzWNxFWC9j0en8
         yDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773021489; x=1773626289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yisBVVL9I5sy6boWcRn9eg7S+T5yb0wcquHxTfd6/Ak=;
        b=nCEjb6noNtiss6kTf4a73SU32AZfKMeOgn6/8qpxOei0jp3yxxNj7HDHJNYBOJMQ5N
         6s+Ujd/1J1UDsB6lNMM6d1/uQ3oyXjK3oQppt4HwLGdElp0wv6c3+fKXyOLEPI/8vpGQ
         ax0L5Nzgg3Au/9Kv7iNgJ9pk0NixhKXUCA1zJifqvG7j5qurFddIeNS9jWj/B2XTn7uY
         q8XfumcV4bYpSDuFKfYhFG/TnZk1Zk5GEYcNsl+EUmKtd56lGUEfi/IzEKWoqjkPyJnT
         KEg0jscrFA+U3lYo789t1HvhXMn+5VW8oZw4NZhGlb/nn+4ybHVgi1XVVGe82OJvNpn/
         2Fqg==
X-Forwarded-Encrypted: i=1; AJvYcCWgMA3b08YQEJ8MGW+Wy5Rlp9G2quOI6RxuSwytHuh2DIDcN9KWanaLtQDt58d6GZRAoHa8ZPEXlL+2mAE+A0pU/kB8@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yx8TJ+MF3PzuJ9CjmUUhvRHBDd488BgR5+enTdwMJRWJ+i6niXR
	J2COeAOsIPItvTzv8S8c6LOXfvkAiw7+M5GxqgjYt6wFz8UI0Od9ZYgZHkALokgoZhbLpDuqs3B
	vV2ewgvkpkxJ6iuHKHeKdrZjM4g3Igrs=
X-Gm-Gg: ATEYQzy/lr6mf8JWUR0b3rPNTKAZhXN6WG7Qp4v6Hvt5xLAhrTiDLU7WKITqnLCsSM/
	6d44ZPDvnkIF4H/HvvOwr5GGQRFUfvTWTwqDxBF2FD0I3cIXVb31BH0zIQ/BgXNP270ZbN26Hmq
	LOrM3TaC6fEPMl3YzgW2vHWaoZ+I6U/Yxh6PGK9SMi+78r08bwuH2gK1+YYeUAZOLkDlVKz3535
	hks0byHoReRdV/t39yH1eN4teSFtKVkgDPckBp2wBoYkScG64m3R6K2N1+Yp8D8a7YZjiuCuXmF
	Fa4eYYVoDB2G6LxqbrFHuWaycnil75W91e7pBkat
X-Received: by 2002:a05:6a21:489:b0:398:71f2:59d8 with SMTP id
 adf61e73a8af0-39871f271a0mr5100735637.56.1773021488729; Sun, 08 Mar 2026
 18:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_5yosWgnNzyVw0QJ=cAsaOG-1-mc6T3=jE+82G9WO7wD2v6Q@mail.gmail.com>
 <189B097EDA1BDF04.2292097@lists.yoctoproject.org>
In-Reply-To: <189B097EDA1BDF04.2292097@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 8 Mar 2026 21:57:57 -0400
X-Gm-Features: AaiRm53qvoMzd5gCGvSEDnntw180SnrmRcPXS0f_nIJeR3hANnDq_tdP_qQSNns
Message-ID: <CADkTA4NXhCPh+smDcgkb1HtjyRib08sgBG2kK96dQYC8kLK9jA@mail.gmail.com>
Subject: Re: [meta-virtualization] GO_MOD_FETCH_MODE vcs broken due invalid tags
To: bruce.ashfield@gmail.com
Cc: ricardo.salveti@oss.qualcomm.com, 
	meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000003d231064c8dbc14"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Mar 2026 01:58:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9627

--00000000000003d231064c8dbc14
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 8, 2026 at 9:55=E2=80=AFPM Bruce Ashfield via lists.yoctoprojec=
t.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:

>
>
> On Sun, Mar 8, 2026 at 2:57=E2=80=AFPM Ricardo Salveti via lists.yoctopro=
ject.org
> <ricardo.salveti=3Doss.qualcomm.com@lists.yoctoproject.org> wrote:
>
>> Hi,
>>
>> I was trying to build docker-compose with GO_MOD_FETCH_MODE set to vcs
>> today and it fails to build due duplicated entries pointing to the
>> same tag but with different commit revisions (failed on fetch). This
>> seems to be caused by
>>
>> https://git.yoctoproject.org/meta-virtualization/commit/scripts?id=3Ddbf=
720ccb0519a4dbf143dbaed1633527b8d7b60
>> and you can see the problematic diff done as part of
>>
>> https://git.yoctoproject.org/meta-virtualization/commit/recipes-containe=
rs/docker-compose?id=3D56a7b72a93fd20d9c21ecdc45487a888b76d194c
>> :
>>
>> +SRC_URI +=3D "git://
>> go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shall=
ow=3D1;rev=3D33540a1f603772f9d4b761f416f5c10dade23e96;name=3Dgit_da0444fc_1=
;destsuffix=3Dvcs_cache/74df1e05ff5bf1317fe42883ce7a496c0ad3800044d955163fd=
3f3acca0a0166
>> "
>> +SRC_URI +=3D "git://
>> go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shall=
ow=3D1;rev=3D33da011f77ade50ff5b6a6fb4a9a1e6d6b285809;name=3Dgit_da0444fc_2=
;destsuffix=3Dvcs_cache/144d2f77c6aa06af51d5820df4e7506c5ecad01c86e770e0027=
b682ff0d3f9a9
>> "
>> +SRC_URI +=3D "git://
>> go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shall=
ow=3D1;rev=3D43e1dd70ce54ee5b1711930029ae5b4926f78f72;name=3Dgit_da0444fc_3=
;destsuffix=3Dvcs_cache/61395547cb668a679b4d7508a904d02fd50ffe1630e5ffd6f4e=
f293a97c2d3ba
>> "
>> +SRC_URI +=3D "git://
>> go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shall=
ow=3D1;rev=3D59db8d763f22395595c26ee1cae0886b57141b3a;name=3Dgit_da0444fc_4=
;destsuffix=3Dvcs_cache/34a6c6ff0efd234ebc0cc2a5cfdad07405fca7403da460f8d25=
bfb69091bc0c5
>> "
>> +SRC_URI +=3D "git://
>> go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shall=
ow=3D1;rev=3D5ac8a444bdc56cee774f8f2b3382156bd27c63c3;name=3Dgit_da0444fc_5=
;destsuffix=3Dvcs_cache/fefde8e557c698aecc8d48f3c3d82b7fea1eb55451adbc71dbe=
d3a8871ed8e13
>> "
>> +SRC_URI +=3D "git://
>> go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shall=
ow=3D1;rev=3D665e8c7367d1ecf644cea2d163019ef59c13d554;name=3Dgit_da0444fc_6=
;destsuffix=3Dvcs_cache/7389e79775019a8b50e34efbdfd1a6f9ee910ef3822e04963ba=
444b3d04db399
>> "
>> +SRC_URI +=3D "git://
>> go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shall=
ow=3D1;rev=3D8c9f86f7a55f5af45a9080f6ed3ac915382d369c;name=3Dgit_da0444fc_7=
;destsuffix=3Dvcs_cache/2b23297aec08f23623501029a20a4eee604e87ce090001ef6ad=
0a5930d799dd5
>> "
>>
>> They are all pointing to the v0.3.0 tag, but all using different git
>> revisions, which will cause fetcher to fail. I tried to have a quick
>> look into the go mod fetcher but wasn't able to quickly identify a fix
>> there.
>>
>
> This was already reported, but I can't reproduce the failure.
>

oh, this is with the pure vcs, and not the hybrid / default mode

This was reported, I have a fix, I'll regenerate the recipes in this update
cycle and
that should fix things up.

Bruce



>
> Obviously if I wasn't building and testing it, it wouldn't be in the tree=
.
>
> Bruce
>
>
>
>>
>> Example of the failure:
>>
>> ERROR: docker-compose-v5.0.0-r0 do_unpack: Bitbake Fetcher Error:
>> FetchError("The revision the git tag 'v0.3.0' resolved to didn't match
>> the SRCREV in use (97ca0e3821bf3a3cf6ea2441ece139e524802385 vs
>> 03fcf44c2211dcd5eb77510b5f7c1fb02d6ded50)",
>> 'git://
>> go.googlesource.com/term;protocol=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shal=
low=3D1;rev=3D03fcf44c2211dcd5eb77510b5f7c1fb02d6ded50;name=3Dgit_2e975dd2_=
0;destsuffix=3Dvcs_cache/39b5e1daf17afc894da71452dbc3a21bfd60c2a69143fd621e=
2f4c38e90360ea
>> ')
>> ERROR: Logfile of failure stored in:
>>
>> /home/rsalveti/build/lmp-next/build-lmp/tmp-lmp/work/corei7-64-lmp-linux=
/docker-compose/v5.0.0/temp/log.do_unpack.7110
>> ERROR: Task
>> (/home/rsalveti/build/lmp-next/build-lmp/conf/../../layers/meta-virtuali=
zation/recipes-containers/docker-compose/
>> docker-compose_git.bb:do_unpack)
>> failed with exit code '1'
>>
>> Other recipes probably have similar issues.
>>
>> Thanks,
>>
>> Ricardo
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
> View/Reply Online (#9626):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9626
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

--00000000000003d231064c8dbc14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Mar 8, 2026 at 9:55=
=E2=80=AFPM Bruce Ashfield via <a href=3D"http://lists.yoctoproject.org">li=
sts.yoctoproject.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@l=
ists.yoctoproject.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v dir=3D"ltr"><div style=3D"font-size:small"><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Mar 8, 2026 =
at 2:57=E2=80=AFPM Ricardo Salveti via <a href=3D"http://lists.yoctoproject=
.org" target=3D"_blank">lists.yoctoproject.org</a> &lt;ricardo.salveti=3D<a=
 href=3D"mailto:oss.qualcomm.com@lists.yoctoproject.org" target=3D"_blank">=
oss.qualcomm.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Hi,<br>
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
></div></div></blockquote><div><br></div><div><div class=3D"gmail_default" =
style=3D"font-size:small">oh, this is with the pure vcs, and not the hybrid=
=C2=A0/ default mode</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small">This=
 was reported, I have a fix, I&#39;ll regenerate the recipes in this update=
 cycle and</div><div class=3D"gmail_default" style=3D"font-size:small">that=
 should fix things up.</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Br=
uce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><div style=3D"f=
ont-size:small"><br></div><div style=3D"font-size:small">Obviously if I was=
n&#39;t building and testing it, it wouldn&#39;t be in the tree.</div><div =
style=3D"font-size:small"><br></div><div style=3D"font-size:small">Bruce</d=
iv><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
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
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9626): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9626" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9626</a><br>
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

--00000000000003d231064c8dbc14--

