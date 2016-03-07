Return-Path: <mbgrego@tycho.nsa.gov>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 87BD8E00848; Mon,  7 Mar 2016 12:25:49 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [63.239.67.9 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from emvm-gh1-uea08.nsa.gov (emvm-gh1-uea08.nsa.gov [63.239.67.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4AED1E00803
	for <meta-virtualization@yoctoproject.org>;
	Mon,  7 Mar 2016 12:25:47 -0800 (PST)
X-TM-IMSS-Message-ID: <75d9458300089bd7@nsa.gov>
Received: from tarius.tycho.ncsc.mil ([144.51.242.1]) by nsa.gov
	([10.208.42.193]) with ESMTP (TREND IMSS SMTP Service 7.1) id
	75d9458300089bd7 ; Mon, 7 Mar 2016 15:24:47 -0500
Received: from moss-wolfpack.infosec.tycho.ncsc.mil (moss-wolfpack
	[192.168.25.76])
	by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id u27KPjNJ029157; 
	Mon, 7 Mar 2016 15:25:45 -0500
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1457127016-16947-1-git-send-email-mbgrego@tycho.nsa.gov>
	<CADkTA4NU8nbaTeWNdRXa4qUgTw9KBCmTXnrwC7hMMYEroS59UA@mail.gmail.com>
From: "M. Gregory" <mbgrego@tycho.nsa.gov>
Message-ID: <56DDE34E.5000602@tycho.nsa.gov>
Date: Mon, 7 Mar 2016 15:23:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4NU8nbaTeWNdRXa4qUgTw9KBCmTXnrwC7hMMYEroS59UA@mail.gmail.com>
X-TM-AS-MML: disable
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Fix QA Issues when building for aarch64 machines
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
X-List-Received-Date: Mon, 07 Mar 2016 20:25:49 -0000
Content-Type: multipart/alternative;
	boundary="------------040700000902090106020900"

--------------040700000902090106020900
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 03/07/2016 11:34 AM, Bruce Ashfield wrote:
> I merged this by mistake while reviewing the change .. but I have a
> question.
>
> On Fri, Mar 4, 2016 at 4:30 PM, Machon Gregory <mbgrego@tycho.nsa.gov
> <mailto:mbgrego@tycho.nsa.gov>> wrote:
>
>     When building for the aarch64 based machines the following QA Issue is
>     produced:
>
>     ERROR: QA Issue: xen: Files/directories were installed but not
>     shipped in any package:
>       /usr/lib64
>       /usr/lib64/efi
>       /usr/lib64/efi/xen-4.6.efi
>       /usr/lib64/efi/xen-4.6.0.efi
>       /usr/lib64/efi/xen.efi
>       /usr/lib64/efi/xen-4.efi
>
>     Signed-off-by: Machon Gregory <mbgrego@tycho.nsa.gov
>     <mailto:mbgrego@tycho.nsa.gov>>
>     ---
>      recipes-extended/xen/xen.inc | 6 ++++++
>      1 file changed, 6 insertions(+)
>
>     diff --git a/recipes-extended/xen/xen.inc
>     b/recipes-extended/xen/xen.inc
>     index d35bc3f..2eba012 100644
>     --- a/recipes-extended/xen/xen.inc
>     +++ b/recipes-extended/xen/xen.inc
>     @@ -151,6 +151,7 @@ PACKAGES = "\
>          ${PN}-dev \
>          ${PN}-devd \
>          ${PN}-doc \
>     +    ${PN}-efi \
>          ${PN}-flask \
>          ${PN}-fsimage \
>          ${PN}-gdbsx \
>     @@ -303,6 +304,11 @@ FILES_${PN}-hypervisor = "\
>          /boot/xen-syms-* \
>          "
>
>     +FILES_${PN}-efi = "\
>     +    ${exec_prefix}/lib64 \
>     +    ${exec_prefix}/lib64/xen* \
>
>
> This should be ${libdir), which tracks lib or lib64 based on the arch.
> I don't have a
> Xen build handy to try a quick test. Can you confirm that libdir also
> fixes this ?
>
In my build ${libdir} is set to /usr/lib despite the architecture
aarch64. Xen arm64.mk manually sets EFI_DIR=/usr/lib64. I realize the
that patch I submitted goes against convention, but I am not sure of the
correct solution. Would it be better to set EFI_DIR=${libdir}?
> Bruce
>  
>
>     +    "
>     +
>      FILES_${PN}-base = "\
>          ${sysconfdir}/xen/auto \
>          ${sysconfdir}/xen/cpupool \
>     --
>     2.1.0
>
>     --
>     _______________________________________________
>     meta-virtualization mailing list
>     meta-virtualization@yoctoproject.org
>     <mailto:meta-virtualization@yoctoproject.org>
>     https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
>
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"

-- 
Machon Gregory
Trusted Mechanisms Team
Trusted Systems Research Group 
(443)634-3832


--------------040700000902090106020900
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    <div class="moz-cite-prefix">On 03/07/2016 11:34 AM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote
cite="mid:CADkTA4NU8nbaTeWNdRXa4qUgTw9KBCmTXnrwC7hMMYEroS59UA@mail.gmail.com"
      type="cite">
      <div dir="ltr">I merged this by mistake while reviewing the change
        .. but I have a question.
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Fri, Mar 4, 2016 at 4:30 PM,
            Machon Gregory <span dir="ltr">&lt;<a
                moz-do-not-send="true"
                href="mailto:mbgrego@tycho.nsa.gov" target="_blank"><a class="moz-txt-link-abbreviated" href="mailto:mbgrego@tycho.nsa.gov">mbgrego@tycho.nsa.gov</a></a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">When
              building for the aarch64 based machines the following QA
              Issue is<br>
              produced:<br>
              <br>
              ERROR: QA Issue: xen: Files/directories were installed but
              not shipped in any package:<br>
                /usr/lib64<br>
                /usr/lib64/efi<br>
                /usr/lib64/efi/xen-4.6.efi<br>
                /usr/lib64/efi/xen-4.6.0.efi<br>
                /usr/lib64/efi/xen.efi<br>
                /usr/lib64/efi/xen-4.efi<br>
              <br>
              Signed-off-by: Machon Gregory &lt;<a
                moz-do-not-send="true"
                href="mailto:mbgrego@tycho.nsa.gov"><a class="moz-txt-link-abbreviated" href="mailto:mbgrego@tycho.nsa.gov">mbgrego@tycho.nsa.gov</a></a>&gt;<br>
              ---<br>
               recipes-extended/xen/xen.inc | 6 ++++++<br>
               1 file changed, 6 insertions(+)<br>
              <br>
              diff --git a/recipes-extended/xen/xen.inc
              b/recipes-extended/xen/xen.inc<br>
              index d35bc3f..2eba012 100644<br>
              --- a/recipes-extended/xen/xen.inc<br>
              +++ b/recipes-extended/xen/xen.inc<br>
              @@ -151,6 +151,7 @@ PACKAGES = "\<br>
                   ${PN}-dev \<br>
                   ${PN}-devd \<br>
                   ${PN}-doc \<br>
              +    ${PN}-efi \<br>
                   ${PN}-flask \<br>
                   ${PN}-fsimage \<br>
                   ${PN}-gdbsx \<br>
              @@ -303,6 +304,11 @@ FILES_${PN}-hypervisor = "\<br>
                   /boot/xen-syms-* \<br>
                   "<br>
              <br>
              +FILES_${PN}-efi = "\<br>
              +    ${exec_prefix}/lib64 \<br>
              +    ${exec_prefix}/lib64/xen* \<br>
            </blockquote>
            <div><br>
            </div>
            <div>This should be ${libdir), which tracks lib or lib64
              based on the arch. I don't have a</div>
            <div>Xen build handy to try a quick test. Can you confirm
              that libdir also fixes this ?</div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    In my build ${libdir} is set to /usr/lib despite the architecture
    aarch64. Xen arm64.mk manually sets EFI_DIR=/usr/lib64. I realize
    the that patch I submitted goes against convention, but I am not
    sure of the correct solution. Would it be better to set
    EFI_DIR=${libdir}? <br>
    <blockquote
cite="mid:CADkTA4NU8nbaTeWNdRXa4qUgTw9KBCmTXnrwC7hMMYEroS59UA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div>Bruce</div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              +    "<br>
              +<br>
               FILES_${PN}-base = "\<br>
                   ${sysconfdir}/xen/auto \<br>
                   ${sysconfdir}/xen/cpupool \<br>
              <span class="HOEnZb"><font color="#888888">--<br>
                  2.1.0<br>
                  <br>
                  --<br>
                  _______________________________________________<br>
                  meta-virtualization mailing list<br>
                  <a moz-do-not-send="true"
                    href="mailto:meta-virtualization@yoctoproject.org">meta-virtualization@yoctoproject.org</a><br>
                  <a moz-do-not-send="true"
                    href="https://lists.yoctoproject.org/listinfo/meta-virtualization"
                    rel="noreferrer" target="_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization</a><br>
                </font></span></blockquote>
          </div>
          <br>
          <br clear="all">
          <div><br>
          </div>
          -- <br>
          <div class="gmail_signature">"Thou shalt not follow the NULL
            pointer, for chaos and madness await thee at its end"</div>
        </div>
      </div>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
Machon Gregory
Trusted Mechanisms Team
Trusted Systems Research Group 
(443)634-3832
</pre>
  </body>
</html>

--------------040700000902090106020900--
