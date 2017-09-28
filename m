Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 564BBE00CA2; Wed, 27 Sep 2017 19:42:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0562EE00C43
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Sep 2017 19:42:21 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8S2gJA6021951
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 27 Sep 2017 19:42:19 -0700
Received: from [128.224.162.167] (128.224.162.167) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 27 Sep 2017 19:42:18 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Christopher Clark
	<christopher.w.clark@gmail.com>
References: <20170926033105.15731-1-Qi.Chen@windriver.com>
	<20170926033105.15731-2-Qi.Chen@windriver.com>
	<CACMJ4Gawh22qtGgedcpZbkOC2=MM7fQHFT5MV-v26gbxWe=BeA@mail.gmail.com>
	<CADkTA4OTUxuz4BX4ZssAJptoapkHO9GMW83C6pVgFM=JTuLAsA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <ed40284d-63df-633f-c933-2f24454ef264@windriver.com>
Date: Thu, 28 Sep 2017 10:47:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4OTUxuz4BX4ZssAJptoapkHO9GMW83C6pVgFM=JTuLAsA@mail.gmail.com>
X-Originating-IP: [128.224.162.167]
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH V3 2/3] linux-yocto: make bbappend have effect conditionally
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
X-List-Received-Date: Thu, 28 Sep 2017 02:42:23 -0000
Content-Type: multipart/alternative;
	boundary="------------1536674782F33DC593FEDA38"

--------------1536674782F33DC593FEDA38
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/27/2017 08:43 PM, Bruce Ashfield wrote:
>
>
> On Tue, Sep 26, 2017 at 4:57 PM, Christopher Clark 
> <christopher.w.clark@gmail.com <mailto:christopher.w.clark@gmail.com>> 
> wrote:
>
>     On Mon, Sep 25, 2017 at 8:31 PM, Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>> wrote:
>     > Make these bbappend files to take effect only when DISTRO_FEATURES
>     > contain 'virtualization'. Otherwise, we would meet failure failure
>     > at system booting up qemux86. Related logs are as below.
>     >
>     >  systemd-modules-load[113]: Failed to insert 'kvm_amd':
>     Operation not supported
>     >  systemd-modules-load[113]: Failed to insert 'kvm_intel':
>     Operation not supported
>     >
>     > Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>     ...
>     > diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc
>     b/recipes-kernel/linux/linux-yocto_virtualization.inc
>     > new file mode 100644
>     > index 0000000..8b296d7
>     > --- /dev/null
>     > +++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
>     > @@ -0,0 +1,20 @@
>     > +FILESEXTRAPATHS_prepend := "${THISDIR}/linux-yocto:"
>     > +
>     > +SRC_URI += "file://xt-checksum.scc \
>     > +            file://ebtables.scc \
>     > +           file://vswitch.scc \
>     > +           file://lxc.scc \
>     > +            file://docker.scc \
>     > +           "
>     > +KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
>     > +
>     > +KERNEL_MODULE_AUTOLOAD += "openvswitch"
>     > +KERNEL_MODULE_AUTOLOAD += "kvm"
>     > +KERNEL_MODULE_AUTOLOAD += "kvm-amd"
>     > +KERNEL_MODULE_AUTOLOAD += "kvm-intel"
>     > +
>     > +# aufs kernel support required for xen-image-minimal
>     > +KERNEL_FEATURES_append +=
>     "${@bb.utils.contains('DISTRO_FEATURES', 'aufs', '
>     features/aufs/aufs-enable.scc', '', d)}"
>     > +
>     > +# xen kernel support
>     > +SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'xen', '
>     file://xen.scc', '', d)}"
>     > --
>     > 2.11.0
>     >
>     > --
>
>     Suggestion for a preferred change: make the KVM features depend on
>     DISTRO_FEATURES containing 'kvm', in the same way that the Xen
>     features do for DISTRO_FEATURES containing 'xen'.
>
>     Here's why: those KVM kernel modules are not of interest on Xen
>     systems. With this change, you're removing the KVM features from the
>     qemu build to solve your bug in hand, by making it conditional on
>     'virtualization', but is still leaves them present when only Xen is
>     needed.
>
>     With that change, I'm not sure whether a 'virtualization' disto
>     feature is immediately useful. It could make sense for features that
>     are hypervisor-agnostic but I don't have an immediate example to point
>     to.
>
>
> I like the suggestion as well. I'd like to future proof this a bit, 
> and we should keep the
> virtualization feature around, but make the KVM features depend on kvm 
> in the
> DISTRO_FEATURES. Less churn on distro flags is a good thing.
>
> Chen Qi, can you rework the check and warning message to reflect that 
> 'kvm'
> is the distro feature to set ?
>
> Bruce
>

Hi Bruce and Christopher,

The status of 'kvm' in yocto (in specific, oe-core layer) is a little 
different from that of 'xen'.

'xen' has been accepted as a distro feature, and the qemu recipe deals 
with it like below.
meta/recipes-devtools/qemu/qemu.inc: 
${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
meta/recipes-devtools/qemu/qemu.inc:PACKAGECONFIG[xen] = 
"--enable-xen,--disable-xen,xen,xen-libxenstore xen-libxenctrl 
xen-libxenguest"

However, for 'kvm', things are different.
It's enabled by default for the qemu (native, nativesdk and target) like 
below.
PACKAGECONFIG ??= " \
         fdt sdl \
         fdt sdl kvm \
         ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
         "
PACKAGECONFIG_class-native ??= "fdt alsa kvm"
PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm"
PACKAGECONFIG[kvm] = "--enable-kvm,--disable-kvm"
To make things more complicated, our runqemu script, and the related 
oeqa parts also deal with the 'kvm' parameter.

When talking about 'kvm' above, I'm talking about it from the view of 
treating 'kvm' as a distro feature. I know that enabling kvm for qemu 
and enabling kvm related configs for kernel are two different things, 
although they are somewhat related.

Given the above situation, I'd like to suggest we don't deal with 'kvm' 
in meta-virtualization for now.
I'll find time to see if we can make 'kvm' as a distro feature in 
oe-core. And we deal with 'kvm' in this layer after that.

Best Regards,
Chen Qi

>
>
>     Christopher
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



--------------1536674782F33DC593FEDA38
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 09/27/2017 08:43 PM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote
cite="mid:CADkTA4OTUxuz4BX4ZssAJptoapkHO9GMW83C6pVgFM=JTuLAsA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Tue, Sep 26, 2017 at 4:57 PM,
            Christopher Clark <span dir="ltr">&lt;<a
                moz-do-not-send="true"
                href="mailto:christopher.w.clark@gmail.com"
                target="_blank">christopher.w.clark@gmail.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex"><span
                class="">On Mon, Sep 25, 2017 at 8:31 PM, Chen Qi &lt;<a
                  moz-do-not-send="true"
                  href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;
                wrote:<br>
                &gt; Make these bbappend files to take effect only when
                DISTRO_FEATURES<br>
                &gt; contain 'virtualization'. Otherwise, we would meet
                failure failure<br>
                &gt; at system booting up qemux86. Related logs are as
                below.<br>
                &gt;<br>
                &gt;  systemd-modules-load[113]: Failed to insert
                'kvm_amd': Operation not supported<br>
                &gt;  systemd-modules-load[113]: Failed to insert
                'kvm_intel': Operation not supported<br>
                &gt;<br>
                &gt; Signed-off-by: Chen Qi &lt;<a
                  moz-do-not-send="true"
                  href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
              </span>...<br>
              <div>
                <div class="h5">&gt; diff --git
                  a/recipes-kernel/linux/linux-<wbr>yocto_virtualization.inc
                  b/recipes-kernel/linux/linux-<wbr>yocto_virtualization.inc<br>
                  &gt; new file mode 100644<br>
                  &gt; index 0000000..8b296d7<br>
                  &gt; --- /dev/null<br>
                  &gt; +++ b/recipes-kernel/linux/linux-<wbr>yocto_virtualization.inc<br>
                  &gt; @@ -0,0 +1,20 @@<br>
                  &gt; +FILESEXTRAPATHS_prepend :=
                  "${THISDIR}/linux-yocto:"<br>
                  &gt; +<br>
                  &gt; +SRC_URI += "<a class="moz-txt-link-freetext" href="file://xt-checksum.scc">file://xt-checksum.scc</a> \<br>
                  &gt; +            <a class="moz-txt-link-freetext" href="file://ebtables.scc">file://ebtables.scc</a> \<br>
                  &gt; +           <a class="moz-txt-link-freetext" href="file://vswitch.scc">file://vswitch.scc</a> \<br>
                  &gt; +           <a class="moz-txt-link-freetext" href="file://lxc.scc">file://lxc.scc</a> \<br>
                  &gt; +            <a class="moz-txt-link-freetext" href="file://docker.scc">file://docker.scc</a> \<br>
                  &gt; +           "<br>
                  &gt; +KERNEL_FEATURES_append = "
                  features/kvm/qemu-kvm-enable.<wbr>scc"<br>
                  &gt; +<br>
                  &gt; +KERNEL_MODULE_AUTOLOAD += "openvswitch"<br>
                  &gt; +KERNEL_MODULE_AUTOLOAD += "kvm"<br>
                  &gt; +KERNEL_MODULE_AUTOLOAD += "kvm-amd"<br>
                  &gt; +KERNEL_MODULE_AUTOLOAD += "kvm-intel"<br>
                  &gt; +<br>
                  &gt; +# aufs kernel support required for
                  xen-image-minimal<br>
                  &gt; +KERNEL_FEATURES_append +=
                  "${@bb.utils.contains('DISTRO_<wbr>FEATURES', 'aufs',
                  ' features/aufs/aufs-enable.scc'<wbr>, '', d)}"<br>
                  &gt; +<br>
                  &gt; +# xen kernel support<br>
                  &gt; +SRC_URI += "${@bb.utils.contains('DISTRO_<wbr>FEATURES',
                  'xen', ' <a class="moz-txt-link-freetext" href="file://xen.scc">file://xen.scc</a>', '', d)}"<br>
                  &gt; --<br>
                  &gt; 2.11.0<br>
                  &gt;<br>
                  &gt; --<br>
                  <br>
                </div>
              </div>
              Suggestion for a preferred change: make the KVM features
              depend on<br>
              DISTRO_FEATURES containing 'kvm', in the same way that the
              Xen<br>
              features do for DISTRO_FEATURES containing 'xen'.<br>
              <br>
              Here's why: those KVM kernel modules are not of interest
              on Xen<br>
              systems. With this change, you're removing the KVM
              features from the<br>
              qemu build to solve your bug in hand, by making it
              conditional on<br>
              'virtualization', but is still leaves them present when
              only Xen is<br>
              needed.<br>
              <br>
              With that change, I'm not sure whether a 'virtualization'
              disto<br>
              feature is immediately useful. It could make sense for
              features that<br>
              are hypervisor-agnostic but I don't have an immediate
              example to point<br>
              to.<br>
            </blockquote>
            <div><br>
            </div>
            <div>I like the suggestion as well. I'd like to future proof
              this a bit, and we should keep the</div>
            <div>virtualization feature around, but make the KVM
              features depend on kvm in the</div>
            <div>DISTRO_FEATURES. Less churn on distro flags is a good
              thing.</div>
            <div><br>
            </div>
            <div>Chen Qi, can you rework the check and warning message
              to reflect that 'kvm'</div>
            <div>is the distro feature to set ?</div>
            <div><br>
            </div>
            <div>Bruce</div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Hi Bruce and Christopher,<br>
    <br>
    The status of 'kvm' in yocto (in specific, oe-core layer) is a
    little different from that of 'xen'.<br>
    <br>
    'xen' has been accepted as a distro feature, and the qemu recipe
    deals with it like below.<br>
    meta/recipes-devtools/qemu/qemu.inc:   
    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \<br>
    meta/recipes-devtools/qemu/qemu.inc:PACKAGECONFIG[xen] =
    "--enable-xen,--disable-xen,xen,xen-libxenstore xen-libxenctrl
    xen-libxenguest"<br>
    <br>
    However, for 'kvm', things are different.<br>
    It's enabled by default for the qemu (native, nativesdk and target)
    like below.<br>
    PACKAGECONFIG ??= " \<br>
            fdt sdl \<br>
            fdt sdl kvm \<br>
            ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \ <br>
            "<br>
    PACKAGECONFIG_class-native ??= "fdt alsa kvm"<br>
    PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm"<br>
    PACKAGECONFIG[kvm] = "--enable-kvm,--disable-kvm"<br>
    To make things more complicated, our runqemu script, and the related
    oeqa parts also deal with the 'kvm' parameter.<br>
    <br>
    When talking about 'kvm' above, I'm talking about it from the view
    of treating 'kvm' as a distro feature. I know that enabling kvm for
    qemu and enabling kvm related configs for kernel are two different
    things, although they are somewhat related.<br>
    <br>
    Given the above situation, I'd like to suggest we don't deal with
    'kvm' in meta-virtualization for now.<br>
    I'll find time to see if we can make 'kvm' as a distro feature in
    oe-core. And we deal with 'kvm' in this layer after that.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote
cite="mid:CADkTA4OTUxuz4BX4ZssAJptoapkHO9GMW83C6pVgFM=JTuLAsA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <span class="HOEnZb"><font color="#888888"><br>
                  Christopher<br>
                </font></span>
              <div class="HOEnZb">
                <div class="h5">--<br>
                  ______________________________<wbr>_________________<br>
                  meta-virtualization mailing list<br>
                  <a moz-do-not-send="true"
                    href="mailto:meta-virtualization@yoctoproject.org">meta-virtualization@<wbr>yoctoproject.org</a><br>
                  <a moz-do-not-send="true"
                    href="https://lists.yoctoproject.org/listinfo/meta-virtualization"
                    rel="noreferrer" target="_blank">https://lists.yoctoproject.<wbr>org/listinfo/meta-<wbr>virtualization</a><br>
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
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------1536674782F33DC593FEDA38--
