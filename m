Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 869C0C021AA
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 19:17:07 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.4547.1739906226074343065
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 Feb 2025 11:17:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BVFXWS4C;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2f9b9c0088fso209356a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 18 Feb 2025 11:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739906225; x=1740511025; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PiqHVi2SszC9ESJOFQRh7Y+uAQlvAP8g04X0OaL+iWo=;
        b=BVFXWS4CHyj3RNavMWbxaW1/Y1RQoCby+qXE8ksH0YENMy0M+mlFtguPwHgxcyRlEE
         JM58vI6cjSiv88V32r/7/jvVt4BNih5h0CAgfKuQu9UXg5jzrFDVKmoW4yyWN76J2jzh
         ycVI1NScGoeASA8emB2K7IYmSEnp5lH5oaTSb2SNr5Mw5YthtZZUJQLVLKLH269WcnAq
         iaGpBxeT+iYFudeeJC2DA6vNPxnsUIpmJPRtZeuco+pIurJUOnVQXqZvnkPPwOUWJyKH
         SJmORyubhds6HuJc/LrMnGWbCWMyyEEDuleNuCkr+zWwcckgU8K5hQQ9alVPC6GFQQSB
         fLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739906225; x=1740511025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PiqHVi2SszC9ESJOFQRh7Y+uAQlvAP8g04X0OaL+iWo=;
        b=hDZJNSkvDlgJViEnVUdQG9SaZPiQKslOb77YiP+e2QaiDGbXZsjfZ4DwA8ufVxS6Dl
         olTqf/ii0N4T0BwqjxSfqPtovkCf+BsUwXlq+lOJWWHjTpVKCBG6JvVvDnKu/id1UW6h
         TySe3Pz2WPHr5TbE/7J0Va/EOWtUKtlhEwMrPgQDUwDuX8eMPML7yoyxTQdfIKgj5S40
         EVXwiFjdYaR7rhWhETtRtuIYkL4aqEZ8Y3qlYQXj7JX8qQCwAeUK8b58T86AgJIfxXLk
         rUITGwKhUGBcucmp/kN5/ASVbTLFXy6BB31Vk20hujC5h2xaZv3MuYbf3igLcbuzE4No
         u6Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUkL82FTgPemp9j9qQ13fi5g/NGfGmyiDNitIOom2+DQW0T1I58foOSwBW/62lGiAD9ZBErCV3LRUSIaa9b/N8s8Y0Z@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxhUK6uyjuS/Fh/XrJpo6MLWB+bQG7LrKlRCoHXcSy8/pBQ3vO/
	h3cxs9zJUrHXUGWwhKDbvBH6IDYy7+G3utm0UOg86gKQ1f/HurvOcPpfgGdqb8W7QGmpkxjJmVY
	XxvgzXIkpgllPSiLe6yWflN6BXQA=
X-Gm-Gg: ASbGnctMTXZDNEwBfiHHe6s5Xlk70H1uX+7zx7e+jdPTy75ZlzUCs0UfMBMGCekgDOY
	jOgArkwMhiJdESxmdtiKtMR6DQI6JMF6MNAXu2HL3xxb71DMCveyk5Gd3ylhIWZ44bHaOXpTj
X-Google-Smtp-Source: AGHT+IGloWqA0c/BqJw3c9B0M91xbpRhX9rxreqKLdn2WHAufvX00mpUMymqgUgOVKkk7RcLn63WHk6sL4k5LV0FCy4=
X-Received: by 2002:a17:90a:e18c:b0:2ee:c30f:33c9 with SMTP id
 98e67ed59e1d1-2fcb4d69950mr1360409a91.14.1739906225271; Tue, 18 Feb 2025
 11:17:05 -0800 (PST)
MIME-Version: 1.0
References: <20250210024557.670568-1-hongxu.jia@windriver.com>
 <20250210024557.670568-2-hongxu.jia@windriver.com> <CADkTA4PAu0w_xMZv6_jwhHBX9Wm-Gp3bsgCtPaiVutiUOsk61Q@mail.gmail.com>
 <15771c7f-bc7e-45cc-aeea-8293b25e4b35@windriver.com>
In-Reply-To: <15771c7f-bc7e-45cc-aeea-8293b25e4b35@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 18 Feb 2025 14:16:50 -0500
X-Gm-Features: AWEUYZn0g0RP66vKWjoHThMBdCza6QdUDLsu-XiZcfYmVhtihRhttx_zVFr12bw
Message-ID: <CADkTA4PkeQo_pg_fWMvBxvOWC+SDbkWpH009paN+qESwxt3knQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] libvirt: add json-c for driver_qemu
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: hongxu.jia@eng.windriver.com, meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000007ffd75062e6f7c1a"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 18 Feb 2025 19:17:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9146

--0000000000007ffd75062e6f7c1a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 1:39=E2=80=AFAM Hongxu Jia <hongxu.jia@windriver.co=
m> wrote:

> On 2/10/25 12:20, Bruce Ashfield wrote:
>
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>
>
> On Sun, Feb 9, 2025 at 9:46=E2=80=AFPM hongxu via lists.yoctoproject.org
> <https://urldefense.com/v3/__http://lists.yoctoproject.org__;!!AjveYdw8Ev=
Q!cPpr-DjHYfzJqX_LYWzEvY1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKy=
Njs6Orjo_-g-6d8PMDAuGVu$>
> <hongxu.jia=3Deng.windriver.com@lists.yoctoproject.org> wrote:
>
>> After upstreamm applied commit [meson: switch checks to depend on json-c
>> as well
>> as yajl][1], json-c is required to build QEMU driver. Otherwise build
>> libvirt
>> failed at do_configure
>>
>> $ bitbake libvirt
>>
>
> Again, you have something different in your environment.
>
> I can build the qemu driver just fine in my configuration.
>
> % bitbake-getvar -r libvirt PACKAGECONFIG
> PACKAGECONFIG=3D"gnutls qemu openvz vmware vbox esx lxc test remote
>            libvirtd netcf udev python fuse firewalld libpcap
>                          libxl                                       "
>
> % bitbake libvirt
>
> .. works. Since qemu is in the default PACAKGECONFIG, you can be assured
> that it was built before the updates were pushed. So we need to understan=
d
> what is different.
>
> I could reproduce the issue via latest poky + meta-virtualization +
> meta-openembedded on master branch
>
> I guess the indirect dependence on json-c was introduced by libvirt in
> your build, you could use the following way:
> ...
> $ bitbake libvirt -g
> $ grep 'json-c.do_populate_sysroot' task-depends.dot
> "libvirt.do_prepare_recipe_sysroot" -> "json-c.do_populate_sysroot"
>


The dependency being added wasn't my question, it was that you didn't
provide enough details of your distro and how you are building things.

A little bit of time poking around shows that if you are building poky,
you'll get json-c indirectly from elfutils as libdebuginfod is in the
PACKAGECONFIG for that package. You must have something different and that
explains why the dependency isn't present.

I'll edit the commit message and stage this, I just added my investigation
to show that you need to have more information in the submissions, since
you can be sure that anything merged to meta-virt has been built and
tested, so you have to ask yourself "What is different in my setup ? .. and
should try to explain that in the commit message".

Bruce


> ...
>
> //Hongxu
>
>
> Bruce
>
>
>
>> ...
>> ../git/meson.build
>> <https://urldefense.com/v3/__http://meson.build__;!!AjveYdw8EvQ!cPpr-DjH=
YfzJqX_LYWzEvY1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKyNjs6Orjo_-=
g-6d8PNpRPhQx$>:1672:6:
>> ERROR: Problem encountered: json-c is required to build QEMU driver
>> ...
>>
>> [1]
>> https://github.com/libvirt/libvirt/commit/28c987263980afc5b606a36a8d264b=
68cb01e9b9
>> <https://urldefense.com/v3/__https://github.com/libvirt/libvirt/commit/2=
8c987263980afc5b606a36a8d264b68cb01e9b9__;!!AjveYdw8EvQ!cPpr-DjHYfzJqX_LYWz=
EvY1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKyNjs6Orjo_-g-6d8PM9XJ8=
xI$>
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>  recipes-extended/libvirt/libvirt_git.bb
>> <https://urldefense.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!cPpr-=
DjHYfzJqX_LYWzEvY1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKyNjs6Orj=
o_-g-6d8PAQ2L6XF$>
>> | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-extended/libvirt/libvirt_git.bb
>> <https://urldefense.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!cPpr-=
DjHYfzJqX_LYWzEvY1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKyNjs6Orj=
o_-g-6d8PAQ2L6XF$>
>> b/recipes-extended/libvirt/libvirt_git.bb
>> <https://urldefense.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!cPpr-=
DjHYfzJqX_LYWzEvY1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKyNjs6Orj=
o_-g-6d8PAQ2L6XF$>
>> index 432b5da8..6a524977 100644
>> --- a/recipes-extended/libvirt/libvirt_git.bb
>> <https://urldefense.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!cPpr-=
DjHYfzJqX_LYWzEvY1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKyNjs6Orj=
o_-g-6d8PAQ2L6XF$>
>> +++ b/recipes-extended/libvirt/libvirt_git.bb
>> <https://urldefense.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!cPpr-=
DjHYfzJqX_LYWzEvY1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKyNjs6Orj=
o_-g-6d8PAQ2L6XF$>
>> @@ -149,7 +149,7 @@ PACKAGECONFIG:remove:armeb =3D "numactl"
>>  # enable,disable,depends,rdepends
>>  #
>>  PACKAGECONFIG[gnutls] =3D ",,,gnutls-bin"
>> -PACKAGECONFIG[qemu] =3D "-Ddriver_qemu=3Denabled -Dqemu_user=3Dqemu
>> -Dqemu_group=3Dqemu,-Ddriver_qemu=3Ddisabled,qemu,"
>> +PACKAGECONFIG[qemu] =3D "-Ddriver_qemu=3Denabled -Dqemu_user=3Dqemu
>> -Dqemu_group=3Dqemu,-Ddriver_qemu=3Ddisabled,qemu json-c,"
>>  PACKAGECONFIG[libxl] =3D
>> "-Ddriver_libxl=3Denabled,-Ddriver_libxl=3Ddisabled,xen,"
>>  PACKAGECONFIG[openvz] =3D
>> "-Ddriver_openvz=3Denabled,-Ddriver_openvz=3Ddisabled,,"
>>  PACKAGECONFIG[vmware] =3D
>> "-Ddriver_vmware=3Denabled,-Ddriver_vmware=3Ddisabled,,"
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#9126):
>> https://lists.yoctoproject.org/g/meta-virtualization/message/9126
>> <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-virtu=
alization/message/9126__;!!AjveYdw8EvQ!cPpr-DjHYfzJqX_LYWzEvY1mwQJ-G1IXdk2h=
VRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKyNjs6Orjo_-g-6d8PA0WULUO$>
>> Mute This Topic: https://lists.yoctoproject.org/mt/111096111/1050810
>> <https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/111096111=
/1050810__;!!AjveYdw8EvQ!cPpr-DjHYfzJqX_LYWzEvY1mwQJ-G1IXdk2hVRfMDxX7pALdst=
jYYfoYnGDw_IAIMO6NLiFKyNjs6Orjo_-g-6d8POZMZ3Ee$>
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
>> <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-virtu=
alization/unsub__;!!AjveYdw8EvQ!cPpr-DjHYfzJqX_LYWzEvY1mwQJ-G1IXdk2hVRfMDxX=
7pALdstjYYfoYnGDw_IAIMO6NLiFKyNjs6Orjo_-g-6d8PMOFfCu6$>
>> [bruce.ashfield@gmail.com]
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
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000007ffd75062e6f7c1a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 10, 2025 at 1:39=
=E2=80=AFAM Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">hong=
xu.jia@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><u></u>

 =20
  <div>
    <div>On 2/10/25 12:20, Bruce Ashfield wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <strong>
      </strong>
      <div style=3D"border:1pt solid rgb(156,101,0);padding:2pt;background:=
rgb(252,252,3)"><strong><u></u><span style=3D"font-size:11pt;color:rgb(0,0,=
0)">CAUTION: This email
              comes from a non Wind River email account!</span><u></u></str=
ong><br>
        <u></u><span style=3D"font-size:10pt;color:rgb(0,0,0)">Do not click=
 links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        <u></u></div>
      <div>
        <div dir=3D"ltr">
          <div dir=3D"ltr">
            <div dir=3D"ltr">
              <div style=3D"font-size:small"><br>
              </div>
            </div>
            <br>
            <div class=3D"gmail_quote">
              <div dir=3D"ltr" class=3D"gmail_attr">On Sun, Feb 9, 2025 at
                9:46=E2=80=AFPM hongxu via <a href=3D"https://urldefense.co=
m/v3/__http://lists.yoctoproject.org__;!!AjveYdw8EvQ!cPpr-DjHYfzJqX_LYWzEvY=
1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKyNjs6Orjo_-g-6d8PMDAuGVu$=
" target=3D"_blank">
                  lists.yoctoproject.org</a> &lt;hongxu.jia=3D<a href=3D"ma=
ilto:eng.windriver.com@lists.yoctoproject.org" target=3D"_blank">eng.windri=
ver.com@lists.yoctoproject.org</a>&gt;
                wrote:<br>
              </div>
              <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                After upstreamm applied commit [meson: switch checks to
                depend on json-c as well<br>
                as yajl][1], json-c is required to build QEMU driver.
                Otherwise build libvirt<br>
                failed at do_configure<br>
                <br>
                $ bitbake libvirt<br>
              </blockquote>
              <div><br>
              </div>
              <div>
                <div style=3D"font-size:small">Again,
                  you have something different in your environment.</div>
                <br>
              </div>
              <div>
                <div style=3D"font-size:small">I can
                  build the qemu driver just fine in my configuration.</div=
>
                <div style=3D"font-size:small"><br>
                </div>
                <span class=3D"gmail_default" style=3D"font-size:small">%</=
span>=C2=A0bitbake-getvar
                -r libvirt PACKAGECONFIG<br>
                <div style=3D"font-size:small">PACKAGECONFIG=3D&quot;gnutls
                  qemu openvz vmware vbox esx lxc test remote =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0
                  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libvirtd netcf udev pyt=
hon fuse firewalld
                  libpcap =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0libxl =C2=A0
                  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;</div>
              </div>
              <div><br>
              </div>
              <div>
                <div style=3D"font-size:small">%
                  bitbake libvirt</div>
                <div style=3D"font-size:small"><br>
                </div>
                <div style=3D"font-size:small">..
                  works. Since qemu is in the default PACAKGECONFIG, you
                  can be assured that it was built before the updates
                  were pushed. So we need to understand what is
                  different.</div>
                <div style=3D"font-size:small"><br>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    I could reproduce the issue via latest poky + meta-virtualization +
    meta-openembedded on master branch<br>
    <br>
    I guess the indirect dependence on json-c was introduced by libvirt
    in your build, you could use the following way:<br>
    ...<br>
    $ bitbake libvirt -g<br>
    $ grep &#39;json-c.do_populate_sysroot&#39; task-depends.dot<br>
    &quot;libvirt.do_prepare_recipe_sysroot&quot; -&gt;
    &quot;json-c.do_populate_sysroot&quot;<br></div></blockquote><div><br><=
/div><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:sm=
all">The dependency being added wasn&#39;t my question, it was that you did=
n&#39;t provide enough details of your distro and how you are building thin=
gs.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">A little bit of time =
poking around shows that if you are building poky, you&#39;ll get json-c in=
directly from elfutils as=C2=A0libdebuginfod is in the PACKAGECONFIG for th=
at package. You must have something different and that explains why the dep=
endency isn&#39;t present.</div><div class=3D"gmail_default" style=3D"font-=
size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">I&#39;ll edit the commit message and stage this, I just added my investig=
ation to show that you need to have more information in the submissions, si=
nce you can be sure that anything merged to meta-virt has been built and te=
sted, so you have to ask yourself &quot;What is different in my setup ? .. =
and should try to explain that in the commit message&quot;.</div></div><div=
 class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"=
gmail_default" style=3D"font-size:small">Bruce</div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div>
    <p>...</p>
    <p>//Hongxu<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite">
      <div>
        <div dir=3D"ltr">
          <div dir=3D"ltr">
            <div class=3D"gmail_quote">
              <div>
                <div style=3D"font-size:small">
                </div>
                <div style=3D"font-size:small">Bruce</div>
                <br>
              </div>
              <div>=C2=A0</div>
              <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                ...<br>
                ../git/<a href=3D"https://urldefense.com/v3/__http://meson.=
build__;!!AjveYdw8EvQ!cPpr-DjHYfzJqX_LYWzEvY1mwQJ-G1IXdk2hVRfMDxX7pALdstjYY=
foYnGDw_IAIMO6NLiFKyNjs6Orjo_-g-6d8PNpRPhQx$" target=3D"_blank">meson.build=
</a>:1672:6: ERROR:
                Problem encountered: json-c is required to build QEMU
                driver<br>
                ...<br>
                <br>
                [1] <a href=3D"https://urldefense.com/v3/__https://github.c=
om/libvirt/libvirt/commit/28c987263980afc5b606a36a8d264b68cb01e9b9__;!!Ajve=
Ydw8EvQ!cPpr-DjHYfzJqX_LYWzEvY1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6=
NLiFKyNjs6Orjo_-g-6d8PM9XJ8xI$" rel=3D"noreferrer" target=3D"_blank">
https://github.com/libvirt/libvirt/commit/28c987263980afc5b606a36a8d264b68c=
b01e9b9</a><br>
                <br>
                Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@=
windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
                ---<br>
                =C2=A0recipes-extended/libvirt/<a href=3D"https://urldefens=
e.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!cPpr-DjHYfzJqX_LYWzEvY1mwQ=
J-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKyNjs6Orjo_-g-6d8PAQ2L6XF$" re=
l=3D"noreferrer" target=3D"_blank">libvirt_git.bb</a> | 2 +-<br>
                =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
                <br>
                diff --git a/recipes-extended/libvirt/<a href=3D"https://ur=
ldefense.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!cPpr-DjHYfzJqX_LYWz=
EvY1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKyNjs6Orjo_-g-6d8PAQ2L6=
XF$" rel=3D"noreferrer" target=3D"_blank">libvirt_git.bb</a>
                b/recipes-extended/libvirt/<a href=3D"https://urldefense.co=
m/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!cPpr-DjHYfzJqX_LYWzEvY1mwQJ-G1=
IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKyNjs6Orjo_-g-6d8PAQ2L6XF$" rel=3D=
"noreferrer" target=3D"_blank">libvirt_git.bb</a><br>
                index 432b5da8..6a524977 100644<br>
                --- a/recipes-extended/libvirt/<a href=3D"https://urldefens=
e.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!cPpr-DjHYfzJqX_LYWzEvY1mwQ=
J-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKyNjs6Orjo_-g-6d8PAQ2L6XF$" re=
l=3D"noreferrer" target=3D"_blank">libvirt_git.bb</a><br>
                +++ b/recipes-extended/libvirt/<a href=3D"https://urldefens=
e.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!cPpr-DjHYfzJqX_LYWzEvY1mwQ=
J-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKyNjs6Orjo_-g-6d8PAQ2L6XF$" re=
l=3D"noreferrer" target=3D"_blank">libvirt_git.bb</a><br>
                @@ -149,7 +149,7 @@ PACKAGECONFIG:remove:armeb =3D
                &quot;numactl&quot;<br>
                =C2=A0# enable,disable,depends,rdepends<br>
                =C2=A0#<br>
                =C2=A0PACKAGECONFIG[gnutls] =3D &quot;,,,gnutls-bin&quot;<b=
r>
                -PACKAGECONFIG[qemu] =3D &quot;-Ddriver_qemu=3Denabled
                -Dqemu_user=3Dqemu
                -Dqemu_group=3Dqemu,-Ddriver_qemu=3Ddisabled,qemu,&quot;<br=
>
                +PACKAGECONFIG[qemu] =3D &quot;-Ddriver_qemu=3Denabled
                -Dqemu_user=3Dqemu
                -Dqemu_group=3Dqemu,-Ddriver_qemu=3Ddisabled,qemu json-c,&q=
uot;<br>
                =C2=A0PACKAGECONFIG[libxl] =3D
                &quot;-Ddriver_libxl=3Denabled,-Ddriver_libxl=3Ddisabled,xe=
n,&quot;<br>
                =C2=A0PACKAGECONFIG[openvz] =3D
                &quot;-Ddriver_openvz=3Denabled,-Ddriver_openvz=3Ddisabled,=
,&quot;<br>
                =C2=A0PACKAGECONFIG[vmware] =3D
                &quot;-Ddriver_vmware=3Denabled,-Ddriver_vmware=3Ddisabled,=
,&quot;<br>
                -- <br>
                2.34.1<br>
                <br>
                <br>
                -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
                Links: You receive all messages sent to this group.<br>
                View/Reply Online (#9126): <a href=3D"https://urldefense.co=
m/v3/__https://lists.yoctoproject.org/g/meta-virtualization/message/9126__;=
!!AjveYdw8EvQ!cPpr-DjHYfzJqX_LYWzEvY1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_=
IAIMO6NLiFKyNjs6Orjo_-g-6d8PA0WULUO$" rel=3D"noreferrer" target=3D"_blank">
https://lists.yoctoproject.org/g/meta-virtualization/message/9126</a><br>
                Mute This Topic: <a href=3D"https://urldefense.com/v3/__htt=
ps://lists.yoctoproject.org/mt/111096111/1050810__;!!AjveYdw8EvQ!cPpr-DjHYf=
zJqX_LYWzEvY1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKyNjs6Orjo_-g-=
6d8POZMZ3Ee$" rel=3D"noreferrer" target=3D"_blank">
                  https://lists.yoctoproject.org/mt/111096111/1050810</a><b=
r>
                Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@=
lists.yoctoproject.org" target=3D"_blank">
                  meta-virtualization+owner@lists.yoctoproject.org</a><br>
                Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.yoctoproject.org/g/meta-virtualization/unsub__;!!AjveYdw8EvQ!cPpr-Dj=
HYfzJqX_LYWzEvY1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKyNjs6Orjo_=
-g-6d8PMOFfCu6$" rel=3D"noreferrer" target=3D"_blank">
https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a href=3D"=
mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com=
</a>]<br>
                -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
                <br>
              </blockquote>
            </div>
            <div><br clear=3D"all">
            </div>
            <div><br>
            </div>
            <span class=3D"gmail_signature_prefix">-- </span><br>
            <div dir=3D"ltr" class=3D"gmail_signature">- Thou shalt not
              follow the NULL pointer, for chaos and madness await thee
              at its end<br>
              - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
              <br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </div>

</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000007ffd75062e6f7c1a--

