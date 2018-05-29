Return-Path: <akuster808@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BE650E00A75; Tue, 29 May 2018 07:56:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (akuster808[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.192.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E8AA9E009D4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 07:56:43 -0700 (PDT)
Received: by mail-pf0-f193.google.com with SMTP id w129-v6so7415777pfd.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 07:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=hO7XHoreLH0s4BpgJHcuMk0mmRtReWo0Qcwpz297gZE=;
	b=pQLaee168cxQEcnHrMjIj1qnDQ14m4SNDQGXdTa1cWlwVfWxHuWxOPOI4Ylu2o/QKR
	nJqEItZQqeqWYt/QDpETF8YkyI7NOMCGcV9k/KajpBXlQ4VxOxhThV0CkWtfwWUfRAJZ
	SJlnWywOXDg0GMchjJIB1h7jHkbdgws8n2yvhWogB3lj7tacLBOTL/+ncsBUYzox2fSF
	dbqAujWSVfaPIZK2dhojM6WWpMJqBTHxEV1A5z/SlTS2u1X28P5/fwHyltwgjg+bRUHd
	MQkeTnwoJb/iklkw6Nm/c0+lmbubeTQCJWSITHcuTEtlojifE3L5Nbvh4IvJ84D5DHdP
	1cLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=hO7XHoreLH0s4BpgJHcuMk0mmRtReWo0Qcwpz297gZE=;
	b=kdETBXX7qu1oOeU6oa6FjMph80mzafrC7u6iCuk/nbq8qVd0NKviEzPNlCotGe5NSl
	FI0lWEIrd8uxerS5G+JT5sQbOi/jhia7CErR/kqUjdN/Va64GFJeamHm5yq3ChKMBWce
	VKY6LY93/K4JgZK/KdA2+eQfmMppDOZ1nt0fkOyCSYuFpC/SrQNJ4A1sJWBpkmDZIM/N
	ouO74OxyejrfZ6h7arm/Dw/pj3njqEkKqyoRuVJ6HOqtQ4gGnI3zbbagrvlRTWxXGvjk
	LH5UvhEP23EIMs7D8RVaMDetS4RjuQI6eBWCtMwt/tUJieE4o7okfzsIYQ52yYl30jba
	c3sA==
X-Gm-Message-State: ALKqPwc2eooP7fJctdwJ4Fv5tTMxP4pGtVcPY+Ml4U1w8V4A05UJGiwE
	d44pvrs2BRTJf+8g/OEKbEykng==
X-Google-Smtp-Source: AB8JxZo8iizsyifXkFnNeLfFkYB99EQ1rdwD/D7cxLz+0j+iBnPXwMRJN9Ghh+5uF0PNL+GQy21STQ==
X-Received: by 2002:a63:b91b:: with SMTP id
	z27-v6mr14045829pge.240.1527605802774; 
	Tue, 29 May 2018 07:56:42 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:f974:961e:eaaf:e53?
	([2601:202:4000:1184:f974:961e:eaaf:e53])
	by smtp.gmail.com with ESMTPSA id
	z28-v6sm17206398pfl.169.2018.05.29.07.56.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 07:56:42 -0700 (PDT)
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	akuster808 <akuster808@gmail.com>
References: <20180525135820.9279-1-pascal.bach@siemens.com>
	<CADkTA4POi2ym7_hXqNuwMT-4dCMnMBVWMkEsuvuhqVGNnym3EQ@mail.gmail.com>
	<765b8896-ad3b-4e58-18e0-78ab15e31d9e@gmail.com>
	<CADkTA4M9Rz8FerSQxVYLC4Xnb8=TJo3WsD4BcQqgX89ZAyTRew@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <79fc5d20-111d-5bec-5e10-0fe210ad2d0f@gmail.com>
Date: Tue, 29 May 2018 07:56:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4M9Rz8FerSQxVYLC4Xnb8=TJo3WsD4BcQqgX89ZAyTRew@mail.gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/2] runc: allow enabling seccomp
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
X-List-Received-Date: Tue, 29 May 2018 14:56:44 -0000
Content-Type: multipart/alternative;
	boundary="------------162A91DA524EA9508DBCF718"
Content-Language: en-US

--------------162A91DA524EA9508DBCF718
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 05/29/2018 07:45 AM, Bruce Ashfield wrote:
>
>
> On Tue, May 29, 2018 at 10:33 AM, akuster808 <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>
>
>     On 05/29/2018 07:25 AM, Bruce Ashfield wrote:
>>     merged.
>>
>>     Bruce
>>
>>     On Fri, May 25, 2018 at 9:58 AM, Pascal Bach
>>     <pascal.bach@siemens.com <mailto:pascal.bach@siemens.com>> wrote:
>>
>>         This requires libseccomp from meta-security so it is not
>>         enabled by default.
>>
>
>     will there be a patch to add this dependency to the layer.conf ?
>
>
>
> We just tweaked it, but yes it will need another patch.
>
> But that dependency is conditional, do we have examples of how to make
> the layer.conf dependency conditional ? We may need a distro or other
> feature, I suppose.
or we just move libseccomp to meta-oe and call it a day ; ) ( something
I have been thinking about for a while)

- armin
>
> Bruce 
>  
>
>
>     - armin
>
>>
>>         Signed-off-by: Pascal Bach <pascal.bach@siemens.com
>>         <mailto:pascal.bach@siemens.com>>
>>         ---
>>          recipes-containers/runc/runc.inc | 6 +++++-
>>          1 file changed, 5 insertions(+), 1 deletion(-)
>>
>>         diff --git a/recipes-containers/runc/runc.inc
>>         b/recipes-containers/runc/runc.inc
>>         index 9199cef..6d11a6e 100644
>>         --- a/recipes-containers/runc/runc.inc
>>         +++ b/recipes-containers/runc/runc.inc
>>         @@ -12,6 +12,10 @@ PV = "${RUNC_VERSION}+git${SRCPV}"
>>
>>          inherit go
>>          inherit goarch
>>         +inherit pkgconfig
>>         +
>>         +PACKAGECONFIG ??= ""
>>         +PACKAGECONFIG[seccomp] = "seccomp,,libseccomp"
>>
>>          RRECOMMENDS_${PN} = "lxc docker"
>>          PROVIDES += "virtual/runc"
>>         @@ -22,7 +26,7 @@ GO_IMPORT = "import"
>>          LIBCONTAINER_PACKAGE="github.com/opencontainers/runc/libcontainer
>>         <http://github.com/opencontainers/runc/libcontainer>"
>>
>>          do_configure[noexec] = "1"
>>         -EXTRA_OEMAKE="BUILDTAGS='' GO=${GO}"
>>         +EXTRA_OEMAKE="BUILDTAGS='${PACKAGECONFIG_CONFARGS}' GO=${GO}"
>>
>>          do_compile() {
>>                 # Set GOPATH. See 'PACKAGERS.md'. Don't rely on
>>         -- 
>>         2.11.0
>>
>>         -- 
>>         _______________________________________________
>>         meta-virtualization mailing list
>>         meta-virtualization@yoctoproject.org
>>         <mailto:meta-virtualization@yoctoproject.org>
>>         https://lists.yoctoproject.org/listinfo/meta-virtualization
>>         <https://lists.yoctoproject.org/listinfo/meta-virtualization>
>>
>>
>>
>>
>>     -- 
>>     "Thou shalt not follow the NULL pointer, for chaos and madness
>>     await thee at its end"
>>
>>
>
>
>
>
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>
>


--------------162A91DA524EA9508DBCF718
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 05/29/2018 07:45 AM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADkTA4M9Rz8FerSQxVYLC4Xnb8=TJo3WsD4BcQqgX89ZAyTRew@mail.gmail.com">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Tue, May 29, 2018 at 10:33 AM,
            akuster808 <span dir="ltr">&lt;<a
                href="mailto:akuster808@gmail.com" target="_blank"
                moz-do-not-send="true">akuster808@gmail.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div text="#000000" bgcolor="#FFFFFF"><span class="">
                  <p><br>
                  </p>
                  <br>
                  <div class="m_-403219837174514555moz-cite-prefix">On
                    05/29/2018 07:25 AM, Bruce Ashfield wrote:<br>
                  </div>
                  <blockquote type="cite">
                    <div dir="ltr">merged.
                      <div><br>
                      </div>
                      <div>Bruce</div>
                    </div>
                    <div class="gmail_extra"><br>
                      <div class="gmail_quote">On Fri, May 25, 2018 at
                        9:58 AM, Pascal Bach <span dir="ltr">&lt;<a
                            href="mailto:pascal.bach@siemens.com"
                            target="_blank" moz-do-not-send="true">pascal.bach@siemens.com</a>&gt;</span>
                        wrote:<br>
                        <blockquote class="gmail_quote" style="margin:0
                          0 0 .8ex;border-left:1px #ccc
                          solid;padding-left:1ex">This requires
                          libseccomp from meta-security so it is not
                          enabled by default.<br>
                        </blockquote>
                      </div>
                    </div>
                  </blockquote>
                  <br>
                </span> will there be a patch to add this dependency to
                the layer.conf ?<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div><br>
            </div>
            <div>We just tweaked it, but yes it will need another patch.</div>
            <div><br>
            </div>
            <div>But that dependency is conditional, do we have examples
              of how to make the layer.conf dependency conditional ? We
              may need a distro or other feature, I suppose.</div>
          </div>
        </div>
      </div>
    </blockquote>
    or we just move libseccomp to meta-oe and call it a day ; ) (
    something I have been thinking about for a while)<br>
    <br>
    - armin<br>
    <blockquote type="cite"
cite="mid:CADkTA4M9Rz8FerSQxVYLC4Xnb8=TJo3WsD4BcQqgX89ZAyTRew@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>Bruce </div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div text="#000000" bgcolor="#FFFFFF"> <br>
                - armin
                <div>
                  <div class="h5"><br>
                    <blockquote type="cite">
                      <div class="gmail_extra">
                        <div class="gmail_quote">
                          <blockquote class="gmail_quote"
                            style="margin:0 0 0 .8ex;border-left:1px
                            #ccc solid;padding-left:1ex"> <br>
                            Signed-off-by: Pascal Bach &lt;<a
                              href="mailto:pascal.bach@siemens.com"
                              target="_blank" moz-do-not-send="true">pascal.bach@siemens.com</a>&gt;<br>
                            ---<br>
                             recipes-containers/runc/runc.<wbr>inc | 6
                            +++++-<br>
                             1 file changed, 5 insertions(+), 1
                            deletion(-)<br>
                            <br>
                            diff --git a/recipes-containers/runc/runc<wbr>.inc
                            b/recipes-containers/runc/runc<wbr>.inc<br>
                            index 9199cef..6d11a6e 100644<br>
                            --- a/recipes-containers/runc/runc<wbr>.inc<br>
                            +++ b/recipes-containers/runc/runc<wbr>.inc<br>
                            @@ -12,6 +12,10 @@ PV =
                            "${RUNC_VERSION}+git${SRCPV}"<br>
                            <br>
                             inherit go<br>
                             inherit goarch<br>
                            +inherit pkgconfig<br>
                            +<br>
                            +PACKAGECONFIG ??= ""<br>
                            +PACKAGECONFIG[seccomp] =
                            "seccomp,,libseccomp"<br>
                            <br>
                             RRECOMMENDS_${PN} = "lxc docker"<br>
                             PROVIDES += "virtual/runc"<br>
                            @@ -22,7 +26,7 @@ GO_IMPORT = "import"<br>
                             LIBCONTAINER_PACKAGE="<a
                              href="http://github.com/opencontainers/runc/libcontainer"
                              rel="noreferrer" target="_blank"
                              moz-do-not-send="true">github.<wbr>com/opencontainers/runc/libcon<wbr>tainer</a>"<br>
                            <br>
                             do_configure[noexec] = "1"<br>
                            -EXTRA_OEMAKE="BUILDTAGS='' GO=${GO}"<br>
                            +EXTRA_OEMAKE="BUILDTAGS='${PA<wbr>CKAGECONFIG_CONFARGS}'
                            GO=${GO}"<br>
                            <br>
                             do_compile() {<br>
                                    # Set GOPATH. See 'PACKAGERS.md'.
                            Don't rely on<br>
                            <span class="m_-403219837174514555HOEnZb"><font
                                color="#888888">-- <br>
                                2.11.0<br>
                                <br>
                                -- <br>
                                ______________________________<wbr>_________________<br>
                                meta-virtualization mailing list<br>
                                <a
                                  href="mailto:meta-virtualization@yoctoproject.org"
                                  target="_blank" moz-do-not-send="true">meta-virtualization@yoctoproje<wbr>ct.org</a><br>
                                <a
                                  href="https://lists.yoctoproject.org/listinfo/meta-virtualization"
                                  rel="noreferrer" target="_blank"
                                  moz-do-not-send="true">https://lists.yoctoproject.org<wbr>/listinfo/meta-virtualization</a><br>
                              </font></span></blockquote>
                        </div>
                        <br>
                        <br clear="all">
                        <div><br>
                        </div>
                        -- <br>
                        <div
                          class="m_-403219837174514555gmail_signature"
                          data-smartmail="gmail_signature">"Thou shalt
                          not follow the NULL pointer, for chaos and
                          madness await thee at its end"</div>
                      </div>
                      <br>
                      <fieldset
                        class="m_-403219837174514555mimeAttachmentHeader"></fieldset>
                      <br>
                    </blockquote>
                    <br>
                  </div>
                </div>
              </div>
            </blockquote>
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
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------162A91DA524EA9508DBCF718--
