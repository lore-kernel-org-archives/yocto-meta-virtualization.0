Return-Path: <jpuhlman@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7ED19E02F53; Tue, 12 Jun 2018 23:08:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.172 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ot0-f172.google.com (mail-ot0-f172.google.com
	[74.125.82.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC57CE02ACE
	for <meta-virtualization@yoctoproject.org>;
	Tue, 12 Jun 2018 23:08:42 -0700 (PDT)
Received: by mail-ot0-f172.google.com with SMTP id w9-v6so1643861otj.7
	for <meta-virtualization@yoctoproject.org>;
	Tue, 12 Jun 2018 23:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=NML0gtmFuAOGNfSa0o9gyKF2wrZEbACh6jplCFYzsAE=;
	b=hkMcwAVrMauzZSiLzJDVvN52WjkuwG8y4qrL+zbhZ8y16Ln+aUsMJuUcehQ5ZPIntI
	xDczJD9PNrPNmdrPKx5/sbdlxXY7rM14hRcgN0mRP4Z5i98bCHzi+QDD1lDKuXqptoBI
	74NeyFhzrPAULjWTzyJSzZPzKx/G2KRKE4hG27/RIjEkyF+gtBzyHVSMmGquuIdZLNQZ
	SYA4TbBLcK6bg4gos1YFLGnh2IWqaarCGkuMkpo3p43Fvyj4AzGQSKJ/8HIC7TEcVoPh
	+vSB/wUeTLSpMMGF6JcdHCnOmb2BoiYseE403q1DzlYxBrGTbcKay70au1gKWSU/+7Yk
	o39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=NML0gtmFuAOGNfSa0o9gyKF2wrZEbACh6jplCFYzsAE=;
	b=XdcUbtT1uiYNtz5v8ajnxLNlInG5aSscT1O4p0VfrXxayGFBGGfxutETPD4lDLIqhY
	vh8e1epGcyOnDuESsXCVwNamCKmryNN9+s4jtMb+uDbigbOnVRTUAPIrVqjN8syY1RYx
	vtzT8ih0+mHgzv7T86PKLVoZhZSjCpLR6hupITKO6pvZGy4kqzjx5NTDhwb/cM7rcudK
	oAD34+q5mjZaejIsiNeawRmTetpuomrPUlIjdwlM+5TCWcevxxLy+NVULuaxSllfZuMi
	4MTBW02YNuXsRvfAzk/r6hzaeqM42dlNpbpv2CmBbsK0v8U2OZkgSv20CFUvQh80JpeH
	tKdA==
X-Gm-Message-State: APt69E2e8sPYzpohUcJE4bjnEIagOdAvdDl/b70nCjDTUr/dWJ9pWcYy
	vxiVAmlnR1g41apR2nj9rqaZbvMGROo=
X-Google-Smtp-Source: ADUXVKKkiCJG/CTAF2ukj5MZiG8pzkSpshxUKgPrMLQ5RHjjgdvXWK2KS++Fm8VZQapskdd1R1P6yg==
X-Received: by 2002:a9d:70d6:: with SMTP id
	w22-v6mr2334269otj.375.1528870122164; 
	Tue, 12 Jun 2018 23:08:42 -0700 (PDT)
Received: from ?IPv6:2600:1700:4c90:60a0:5566:b07f:3f47:4a0e?
	([2600:1700:4c90:60a0:5566:b07f:3f47:4a0e])
	by smtp.gmail.com with ESMTPSA id
	u15-v6sm1967266oif.19.2018.06.12.23.08.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jun 2018 23:08:41 -0700 (PDT)
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1528843023-21625-1-git-send-email-jpuhlman@mvista.com>
	<CADkTA4O-6yFZtarpDoefbNk5xsJjadhS_oZCzOt2hPbnJiazwQ@mail.gmail.com>
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <687e474d-b386-42a8-43da-3b83181441a2@mvista.com>
Date: Tue, 12 Jun 2018 23:08:38 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4O-6yFZtarpDoefbNk5xsJjadhS_oZCzOt2hPbnJiazwQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 13 Jun 2018 06:08:49 -0000
Content-Type: multipart/alternative;
	boundary="------------487D22EBC46A9A9BC16F4E82"
Content-Language: en-US

--------------487D22EBC46A9A9BC16F4E82
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/12/2018 10:57 PM, Bruce Ashfield wrote:
>
>
> On Tue, Jun 12, 2018 at 6:37 PM, Jeremy Puhlman <jpuhlman@mvista.com 
> <mailto:jpuhlman@mvista.com>> wrote:
>
>     /etc/libvirt/qemu.conf doesn't exist if qemu is disabled causing a
>     build failure.
>
>     Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com
>     <mailto:jpuhlman@mvista.com>>
>     ---
>      recipes-extended/libvirt/libvirt_4.3.0.bb
>     <http://libvirt_4.3.0.bb> | 6 ++++--
>      1 file changed, 4 insertions(+), 2 deletions(-)
>
>     diff --git a/recipes-extended/libvirt/libvirt_4.3.0.bb
>     <http://libvirt_4.3.0.bb>
>     b/recipes-extended/libvirt/libvirt_4.3.0.bb <http://libvirt_4.3.0.bb>
>     index ef51b9e..5cae02b 100644
>     --- a/recipes-extended/libvirt/libvirt_4.3.0.bb
>     <http://libvirt_4.3.0.bb>
>     +++ b/recipes-extended/libvirt/libvirt_4.3.0.bb
>     <http://libvirt_4.3.0.bb>
>     @@ -266,8 +266,10 @@ do_install_append() {
>             fi
>
>             # disable seccomp_sandbox
>     -       sed -i '/^#seccomp_sandbox = 1/aseccomp_sandbox = 0' \
>     -           ${D}${sysconfdir}/libvirt/qemu.conf
>     +        if ${@bb.utils.contains('PACKAGECONFIG', 'qemu', 'true',
>     'false', d)}; then
>
>
> Rather than key off the package config, why not just test for the 
> file's existence and then only operate on it if it is there ? That is 
> always safe, simpler and protects us from build failures if the 
> behaviour/output of libvirt changes with respect to qemu in the future.
>
> We could argue that we could check both, or warn if the package config 
> is on, but the file isn't present .. but I'd still prefer to just keep 
> it simple and all basic shell operations.

That's reasonable. I was more or less just following the pattern of the 
other PACKAGECONFIG checks, i.e. systemd and polkit. I can change it to 
a file check, if that would work better.

>
> Cheers,
>
> Bruce
>
>     +          sed -i '/^#seccomp_sandbox = 1/aseccomp_sandbox = 0' \
>     +              ${D}${sysconfdir}/libvirt/qemu.conf
>     +        fi
>
>             # Add hook support for libvirt
>             mkdir -p ${D}/etc/libvirt/hooks
>     -- 
>     2.6.2
>
>     -- 
>     _______________________________________________
>     meta-virtualization mailing list
>     meta-virtualization@yoctoproject.org
>     <mailto:meta-virtualization@yoctoproject.org>
>     https://lists.yoctoproject.org/listinfo/meta-virtualization
>     <https://lists.yoctoproject.org/listinfo/meta-virtualization>
>
>
>
>
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end"

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


--------------487D22EBC46A9A9BC16F4E82
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <br>
    <div class="moz-cite-prefix">On 6/12/2018 10:57 PM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADkTA4O-6yFZtarpDoefbNk5xsJjadhS_oZCzOt2hPbnJiazwQ@mail.gmail.com">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Tue, Jun 12, 2018 at 6:37 PM,
            Jeremy Puhlman <span dir="ltr">&lt;<a
                href="mailto:jpuhlman@mvista.com" target="_blank"
                moz-do-not-send="true">jpuhlman@mvista.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">/etc/libvirt/qemu.conf
              doesn't exist if qemu is disabled causing a<br>
              build failure.<br>
              <br>
              Signed-off-by: Jeremy Puhlman &lt;<a
                href="mailto:jpuhlman@mvista.com" moz-do-not-send="true">jpuhlman@mvista.com</a>&gt;<br>
              ---<br>
               recipes-extended/libvirt/<a
                href="http://libvirt_4.3.0.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">libvi<wbr>rt_4.3.0.bb</a>
              | 6 ++++--<br>
               1 file changed, 4 insertions(+), 2 deletions(-)<br>
              <br>
              diff --git a/recipes-extended/libvirt/<a
                href="http://libvirt_4.3.0.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">lib<wbr>virt_4.3.0.bb</a>
              b/recipes-extended/libvirt/<a
                href="http://libvirt_4.3.0.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">lib<wbr>virt_4.3.0.bb</a><br>
              index ef51b9e..5cae02b 100644<br>
              --- a/recipes-extended/libvirt/<a
                href="http://libvirt_4.3.0.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">lib<wbr>virt_4.3.0.bb</a><br>
              +++ b/recipes-extended/libvirt/<a
                href="http://libvirt_4.3.0.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">lib<wbr>virt_4.3.0.bb</a><br>
              @@ -266,8 +266,10 @@ do_install_append() {<br>
                      fi<br>
              <br>
                      # disable seccomp_sandbox<br>
              -       sed -i '/^#seccomp_sandbox = 1/aseccomp_sandbox =
              0' \<br>
              -           ${D}${sysconfdir}/libvirt/<wbr>qemu.conf<br>
              +        if ${@bb.utils.contains('<wbr>PACKAGECONFIG',
              'qemu', 'true', 'false', d)}; then<br>
            </blockquote>
            <div><br>
            </div>
            <div>Rather than key off the package config, why not just
              test for the file's existence and then only operate on it
              if it is there ? That is always safe, simpler and protects
              us from build failures if the behaviour/output of libvirt
              changes with respect to qemu in the future.</div>
            <div><br>
            </div>
            <div>We could argue that we could check both, or warn if the
              package config is on, but the file isn't present .. but
              I'd still prefer to just keep it simple and all basic
              shell operations.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    That's reasonable. I was more or less just following the pattern of
    the other PACKAGECONFIG checks, i.e. systemd and polkit. I can
    change it to a file check, if that would work better.<br>
    <br>
    <blockquote type="cite"
cite="mid:CADkTA4O-6yFZtarpDoefbNk5xsJjadhS_oZCzOt2hPbnJiazwQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>Cheers,</div>
            <div><br>
            </div>
            <div>Bruce</div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              +          sed -i '/^#seccomp_sandbox = 1/aseccomp_sandbox
              = 0' \<br>
              +              ${D}${sysconfdir}/libvirt/<wbr>qemu.conf<br>
              +        fi<br>
              <br>
                      # Add hook support for libvirt<br>
                      mkdir -p ${D}/etc/libvirt/hooks<br>
              <span class="HOEnZb"><font color="#888888">-- <br>
                  2.6.2<br>
                  <br>
                  -- <br>
                  ______________________________<wbr>_________________<br>
                  meta-virtualization mailing list<br>
                  <a href="mailto:meta-virtualization@yoctoproject.org"
                    moz-do-not-send="true">meta-virtualization@<wbr>yoctoproject.org</a><br>
                  <a
                    href="https://lists.yoctoproject.org/listinfo/meta-virtualization"
                    rel="noreferrer" target="_blank"
                    moz-do-not-send="true">https://lists.yoctoproject.<wbr>org/listinfo/meta-<wbr>virtualization</a><br>
                </font></span></blockquote>
          </div>
          <br>
          <br clear="all">
          <div><br>
          </div>
          -- <br>
          <div class="gmail_signature" data-smartmail="gmail_signature">"Thou
            shalt not follow the NULL pointer, for chaos and madness
            await thee at its end"</div>
        </div>
      </div>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
Jeremy A. Puhlman
<a class="moz-txt-link-abbreviated" href="mailto:jpuhlman@mvista.com">jpuhlman@mvista.com</a>
</pre>
  </body>
</html>

--------------487D22EBC46A9A9BC16F4E82--
