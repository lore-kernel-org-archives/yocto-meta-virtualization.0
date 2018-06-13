Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DF056E01CFC; Wed, 13 Jun 2018 05:56:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 72612E00C88
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 Jun 2018 05:56:13 -0700 (PDT)
Received: by mail-lf0-f66.google.com with SMTP id g21-v6so3798143lfb.4
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 Jun 2018 05:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mn0Po7Fm7yGQTVxHfN3G32gPnaJ/e01Nrcz7dLyxGZ0=;
	b=lqPR6de+leEtpv9ad6/0avLp0/WgRGIme5HHzm4OAhopzv07ta+aneuxGXmfDMguZY
	NKcn3Up2KMNM8N/3jIifXOGko+Zve7fmMU28O521oRaAFtVS89rjV2fRRTwBgXy7zNdd
	w/GgQ98F5cDO8Q2viRdRl0iVLNFomIAHxGLd7RIsoiunKaaCMNqSRTu4wReIIdNZynW4
	wEBL8oRRnoQvSLf+oQFeg705mHlykUrSF9A1yQ550LqVEdVaScKqyX3LutMS8Dciq1XM
	cGUMyVZs5AcCarCpobq128IsTT5tXrk/9/gorxXh108c3wbAOmvaDqqujIxqsUEMKSFp
	YbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mn0Po7Fm7yGQTVxHfN3G32gPnaJ/e01Nrcz7dLyxGZ0=;
	b=tk4HZSn6O2/OW03DjGEoQu2vIEdLJg283xLQTwg3qRFk3YD6B3qeeykqyN+McaZ82Z
	mMIlOMwrwwGBz9rEh3XhDq+lsuy8XITKxJ3aDfq/SCT+dqIjuaROmFysxLur5m7BY2Nk
	yGRtvmU1S8/NTmjGLHUIvRtbvIacb5Y/uQOMe4FZul7qqPobJi1W8/cJiNqhZor5BTxU
	cQlLxWYaBCRQBMll9bi/y5bwzU4jsvUMm2d3oe9qFuarSTiOZ9uMfSU2SxW0JCdylqEQ
	oRWpZ98TdpEaxKJ7FtuKBt4zm+eRNkAU8gUNm7rfXQ5kvA/NFh6O9eBcs5ZXIH6ZK2b9
	OtPQ==
X-Gm-Message-State: APt69E1l5oHrrhI/6lrFhkd2GGykShJBmTlkwkbjIKdVZvaN9l3H8o4+
	JoN3yRJUCBY2qdlMwzZYUuumLlvCtQ/dslqVqJu4Tg==
X-Google-Smtp-Source: ADUXVKILV29IK1USBe2rjzl8ZlHN4Ca03asQueenFwpwQHH6DL5CzwtH2e+8lAmIa+QVSD212Ox1ttGYJnvYvvJEnA8=
X-Received: by 2002:a19:2101:: with SMTP id
	h1-v6mr3116054lfh.135.1528894572303; 
	Wed, 13 Jun 2018 05:56:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:161a:0:0:0:0:0 with HTTP; Wed, 13 Jun 2018 05:56:07
	-0700 (PDT)
In-Reply-To: <687e474d-b386-42a8-43da-3b83181441a2@mvista.com>
References: <1528843023-21625-1-git-send-email-jpuhlman@mvista.com>
	<CADkTA4O-6yFZtarpDoefbNk5xsJjadhS_oZCzOt2hPbnJiazwQ@mail.gmail.com>
	<687e474d-b386-42a8-43da-3b83181441a2@mvista.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 13 Jun 2018 08:56:07 -0400
Message-ID: <CADkTA4PTGq0nQc2+DGh3m+LBeY-bNMUG4t+A1vK+rfZf0MgAgQ@mail.gmail.com>
To: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] Check for qemu pkgconfig before qemu.conf modify
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jun 2018 12:56:16 -0000
Content-Type: multipart/alternative; boundary="000000000000e19881056e85818a"

--000000000000e19881056e85818a
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 13, 2018 at 2:08 AM, Jeremy A. Puhlman <jpuhlman@mvista.com>
wrote:

>
>
> On 6/12/2018 10:57 PM, Bruce Ashfield wrote:
>
>
>
> On Tue, Jun 12, 2018 at 6:37 PM, Jeremy Puhlman <jpuhlman@mvista.com>
> wrote:
>
>> /etc/libvirt/qemu.conf doesn't exist if qemu is disabled causing a
>> build failure.
>>
>> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
>> ---
>>  recipes-extended/libvirt/libvirt_4.3.0.bb | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-extended/libvirt/libvirt_4.3.0.bb
>> b/recipes-extended/libvirt/libvirt_4.3.0.bb
>> index ef51b9e..5cae02b 100644
>> --- a/recipes-extended/libvirt/libvirt_4.3.0.bb
>> +++ b/recipes-extended/libvirt/libvirt_4.3.0.bb
>> @@ -266,8 +266,10 @@ do_install_append() {
>>         fi
>>
>>         # disable seccomp_sandbox
>> -       sed -i '/^#seccomp_sandbox = 1/aseccomp_sandbox = 0' \
>> -           ${D}${sysconfdir}/libvirt/qemu.conf
>> +        if ${@bb.utils.contains('PACKAGECONFIG', 'qemu', 'true',
>> 'false', d)}; then
>>
>
> Rather than key off the package config, why not just test for the file's
> existence and then only operate on it if it is there ? That is always safe,
> simpler and protects us from build failures if the behaviour/output of
> libvirt changes with respect to qemu in the future.
>
> We could argue that we could check both, or warn if the package config is
> on, but the file isn't present .. but I'd still prefer to just keep it
> simple and all basic shell operations.
>
>
> That's reasonable. I was more or less just following the pattern of the
> other PACKAGECONFIG checks, i.e. systemd and polkit. I can change it to a
> file check, if that would work better.
>
>
I can convert the other ones later as well. I didn't write them, so I was
just going by what I could see in the context of the patch! But yah, if we
could set the precedent with this change that would be great.

Bruce


>
> Cheers,
>
> Bruce
>
>
>> +          sed -i '/^#seccomp_sandbox = 1/aseccomp_sandbox = 0' \
>> +              ${D}${sysconfdir}/libvirt/qemu.conf
>> +        fi
>>
>>         # Add hook support for libvirt
>>         mkdir -p ${D}/etc/libvirt/hooks
>> --
>> 2.6.2
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>
>
> --
> Jeremy A. Puhlmanjpuhlman@mvista.com
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--000000000000e19881056e85818a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Jun 13, 2018 at 2:08 AM, Jeremy A. Puhlman <span dir=3D"ltr">&l=
t;<a href=3D"mailto:jpuhlman@mvista.com" target=3D"_blank">jpuhlman@mvista.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF"><span class=3D"">
    <br>
    <br>
    <div class=3D"m_4454473816275130740moz-cite-prefix">On 6/12/2018 10:57 =
PM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr"><br>
        <div class=3D"gmail_extra"><br>
          <div class=3D"gmail_quote">On Tue, Jun 12, 2018 at 6:37 PM,
            Jeremy Puhlman <span dir=3D"ltr">&lt;<a href=3D"mailto:jpuhlman=
@mvista.com" target=3D"_blank">jpuhlman@mvista.com</a>&gt;</span>
            wrote:<br>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">/etc/libvirt/qemu.conf
              doesn&#39;t exist if qemu is disabled causing a<br>
              build failure.<br>
              <br>
              Signed-off-by: Jeremy Puhlman &lt;<a href=3D"mailto:jpuhlman@=
mvista.com" target=3D"_blank">jpuhlman@mvista.com</a>&gt;<br>
              ---<br>
              =C2=A0recipes-extended/libvirt/<a href=3D"http://libvirt_4.3.=
0.bb" rel=3D"noreferrer" target=3D"_blank">libv<wbr>irt_4.3.0.bb</a>
              | 6 ++++--<br>
              =C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
              <br>
              diff --git a/recipes-extended/libvirt/<a href=3D"http://libvi=
rt_4.3.0.bb" rel=3D"noreferrer" target=3D"_blank">lib<wbr>virt_4.3.0.bb</a>
              b/recipes-extended/libvirt/<a href=3D"http://libvirt_4.3.0.bb=
" rel=3D"noreferrer" target=3D"_blank">lib<wbr>virt_4.3.0.bb</a><br>
              index ef51b9e..5cae02b 100644<br>
              --- a/recipes-extended/libvirt/<a href=3D"http://libvirt_4.3.=
0.bb" rel=3D"noreferrer" target=3D"_blank">lib<wbr>virt_4.3.0.bb</a><br>
              +++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_4.3.=
0.bb" rel=3D"noreferrer" target=3D"_blank">lib<wbr>virt_4.3.0.bb</a><br>
              @@ -266,8 +266,10 @@ do_install_append() {<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
              <br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 # disable seccomp_sandbox<br>
              -=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;/^#seccomp_sandbox =
=3D 1/aseccomp_sandbox =3D
              0&#39; \<br>
              -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${sysconfdir}/l=
ibvirt/qem<wbr>u.conf<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;PAC=
KAGEC<wbr>ONFIG&#39;,
              &#39;qemu&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br=
>
            </blockquote>
            <div><br>
            </div>
            <div>Rather than key off the package config, why not just
              test for the file&#39;s existence and then only operate on it
              if it is there ? That is always safe, simpler and protects
              us from build failures if the behaviour/output of libvirt
              changes with respect to qemu in the future.</div>
            <div><br>
            </div>
            <div>We could argue that we could check both, or warn if the
              package config is on, but the file isn&#39;t present .. but
              I&#39;d still prefer to just keep it simple and all basic
              shell operations.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br></span>
    That&#39;s reasonable. I was more or less just following the pattern of
    the other PACKAGECONFIG checks, i.e. systemd and polkit. I can
    change it to a file check, if that would work better.<span class=3D""><=
br>
    <br></span></div></blockquote><div><br></div><div>I can convert the oth=
er ones later as well. I didn&#39;t write them, so I was just going by what=
 I could see in the context of the patch! But yah, if we could set the prec=
edent with this change that would be great.</div><div><br></div><div>Bruce<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div text=3D"#000000" =
bgcolor=3D"#FFFFFF"><span class=3D"">
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <div><br>
            </div>
            <div>Cheers,</div>
            <div><br>
            </div>
            <div>Bruce</div>
            <div>=C2=A0</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;/^#seccomp_sa=
ndbox =3D 1/aseccomp_sandbox
              =3D 0&#39; \<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${sysco=
nfdir}/libvirt/qemu<wbr>.conf<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
              <br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Add hook support for libvirt<br=
>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}/etc/libvirt/hooks<b=
r>
              <span class=3D"m_4454473816275130740HOEnZb"><font color=3D"#8=
88888">-- <br>
                  2.6.2<br>
                  <br>
                  -- <br>
                  ______________________________<wbr>_________________<br>
                  meta-virtualization mailing list<br>
                  <a href=3D"mailto:meta-virtualization@yoctoproject.org" t=
arget=3D"_blank">meta-virtualization@yoctoproje<wbr>ct.org</a><br>
                  <a href=3D"https://lists.yoctoproject.org/listinfo/meta-v=
irtualization" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org<wbr>/listinfo/meta-virtualization</a><br>
                </font></span></blockquote>
          </div>
          <br>
          <br clear=3D"all">
          <div><br>
          </div>
          -- <br>
          <div class=3D"m_4454473816275130740gmail_signature" data-smartmai=
l=3D"gmail_signature">&quot;Thou
            shalt not follow the NULL pointer, for chaos and madness
            await thee at its end&quot;</div>
        </div>
      </div>
    </blockquote>
    <br>
    </span><span class=3D"HOEnZb"><font color=3D"#888888"><pre class=3D"m_4=
454473816275130740moz-signature" cols=3D"72">--=20
Jeremy A. Puhlman
<a class=3D"m_4454473816275130740moz-txt-link-abbreviated" href=3D"mailto:j=
puhlman@mvista.com" target=3D"_blank">jpuhlman@mvista.com</a>
</pre>
  </font></span></div>

</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--000000000000e19881056e85818a--
