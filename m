Return-Path: <Lei.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85C9CE01473
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Jan 2013 18:19:57 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r092JlRY029017
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 Jan 2013 18:19:48 -0800 (PST)
Received: from [128.224.158.164] (128.224.158.164) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 8 Jan 2013 18:19:47 -0800
Message-ID: <50ECD3DF.9070607@windriver.com>
Date: Wed, 9 Jan 2013 10:20:15 +0800
From: Lei Yang <lei.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: "Prica, Mihai" <mihai.prica@intel.com>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
References: <1357560505-24122-1-git-send-email-mihai.prica@intel.com>
	<1357560505-24122-2-git-send-email-mihai.prica@intel.com>
	<50EB053F.2040809@se-eng.com>
	<CADkTA4NfJq0e-Kcg99uotS1O5ny0uQw=VVmKV0yxwwoMxqdNuw@mail.gmail.com>
	<50EB1486.4080901@se-eng.com>
	<97BD068FB200C44AA73C2B641F162ECF8FB2DC@IRSMSX101.ger.corp.intel.com>
In-Reply-To: <97BD068FB200C44AA73C2B641F162ECF8FB2DC@IRSMSX101.ger.corp.intel.com>
X-Originating-IP: [128.224.158.164]
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/2] linux-yocto: added kernel configuration for KVM
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: lei.yang@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Jan 2013 02:19:57 -0000
Content-Type: multipart/alternative;
	boundary="------------090406000808090408030904"

--------------090406000808090408030904
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/09/2013 02:45 AM, Prica, Mihai wrote:
>
> I didn't know about the configuration fragments from the kernel tree. 
> I'll redo the patch to use those.
>
> I see that the .cfg from the kernel tree enables kvm as modules. In 
> this situation, I think I need to add an extra RRECOMMENDS with the 
> necessary kernel-module-kvm to bring the necessary modules to the 
> sysroot.  Where would be the best places to add this, considering 
> there is no specific recipe for kvm? I tried to add them to the image 
> recipe but it didn't worked.
>

It often to add below line in conf/machine/**.conf, I don't see it in 
meta-virt, Bruce may give some better comments

MACHINE_EXTRA_RRECOMMENDS = "kernel-module-kvm"

and need to make sure the kvm moudles built with "M" first

Lei



> Thanks,
>
> Mihai
>
> *From:*meta-virtualization-bounces@yoctoproject.org 
> [mailto:meta-virtualization-bounces@yoctoproject.org] *On Behalf Of 
> *Raymond Danks
> *Sent:* Monday, January 07, 2013 8:32 PM
> *To:* Bruce Ashfield
> *Cc:* meta-virtualization@yoctoproject.org
> *Subject:* Re: [meta-virtualization] [PATCH 1/2] linux-yocto: added 
> kernel configuration for KVM
>
> On 01/07/2013 11:10 AM, Bruce Ashfield wrote:
>
>     On Mon, Jan 7, 2013 at 12:26 PM, Raymond Danks
>     <ray.danks@se-eng.com <mailto:ray.danks@se-eng.com>> wrote:
>
>     I'm going to show my lack of knowledge in this area, but I know
>     this is going to come up when I push a xen.cfg that I apparently
>     never added.
>
>     Is it possible to do something along the lines of PACKAGE_CONFIG
>     in the linux-yocto.bbappend?  For example, in the libvirt package
>     one can use PACKAGE_CONFIG to construct a "minimal" build of
>     libvirt.  What would be the method for one to do the same in this
>     package?
>
>     kernel configuration fragment use are controlled via the
>     KERNEL_FEATURES variable, and
>
>     for anything pre-yocto 1.4 that means an in-tree kernel
>     configuration fragment (I'm still pushing
>
>     for the fragments to be maintained in tree, since that allows them
>     to be reused and maintained
>
>     more easily).
>
>     KERNEL_FEATURES is managed like any other variable in the system,
>     including updating
>
>     it via optional/dynamic features as we see fit.
>
>
> Thanks Bruce.  Yes, KERNEL_FEATURES is what I was looking for, I 
> believe.  I'm seeing some references and examples for this now.
>
> Ray
>
>
>
>     Yes, I imagine that worst case there can be a SRC_URI_distro
>     definition that includes only the .scc files required for that
>     "minimal" image build, but it seems like we want to keep away from
>     that as much as possible being that this isn't a distro layer.
>
> Typically we do this via a base KERNEL_FEATURES specification in the 
> relevant recipe(s), and
>
> distros, or other configurations can override/extend it as required.
>
> Cheers,
>
> Buce
>
>     Thanks,
>     Ray
>
>
>
>     On 01/07/2013 05:08 AM, Mihai Prica wrote:
>
>     Signed-off-by: Mihai Prica <mihai.prica@intel.com
>     <mailto:mihai.prica@intel.com>>
>     ---
>       recipes-kernel/linux/linux-yocto/kvm-enable.scc |    4 ++++
>       recipes-kernel/linux/linux-yocto/kvm.cfg        |    4 ++++
>       recipes-kernel/linux/linux-yocto_3.4.bbappend   |    1 +
>       3 files changed, 9 insertions(+)
>       create mode 100644 recipes-kernel/linux/linux-yocto/kvm-enable.scc
>       create mode 100644 recipes-kernel/linux/linux-yocto/kvm.cfg
>
>     diff --git a/recipes-kernel/linux/linux-yocto/kvm-enable.scc
>     b/recipes-kernel/linux/linux-yocto/kvm-enable.scc
>     new file mode 100644
>     index 0000000..0b5f4fc
>     --- /dev/null
>     +++ b/recipes-kernel/linux/linux-yocto/kvm-enable.scc
>     @@ -0,0 +1,4 @@
>     +define KFEATURE_DESCRIPTION "Enable KVM host support"
>     +define KFEATURE_COMPATIBILITY board
>     +
>     +kconf non-hardware kvm.cfg
>     diff --git a/recipes-kernel/linux/linux-yocto/kvm.cfg
>     b/recipes-kernel/linux/linux-yocto/kvm.cfg
>     new file mode 100644
>     index 0000000..0cfcf58
>     --- /dev/null
>     +++ b/recipes-kernel/linux/linux-yocto/kvm.cfg
>     @@ -0,0 +1,4 @@
>     +CONFIG_KVM=y
>     +CONFIG_KVM_INTEL=y
>     +CONFIG_KVM_AMD=y
>     +CONFIG_TUN=y
>     diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend
>     b/recipes-kernel/linux/linux-yocto_3.4.bbappend
>     index 5b163ff..71bead2 100644
>     --- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
>     +++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
>     @@ -4,5 +4,6 @@ SRC_URI += "file://xt-checksum.scc
>     <file:///%5C%5Cxt-checksum.scc> \
>     file://ebtables.scc <file:///%5C%5Cebtables.scc> \
>     file://vswitch.scc <file:///%5C%5Cvswitch.scc> \
>     file://lxc.scc <file:///%5C%5Clxc.scc> \
>     + file://kvm-enable.scc <file:///%5C%5Ckvm-enable.scc> \
>                 "
>
>     _______________________________________________
>     meta-virtualization mailing list
>     meta-virtualization@yoctoproject.org
>     <mailto:meta-virtualization@yoctoproject.org>
>     https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end"
>
>
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization


--------------090406000808090408030904
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    On 01/09/2013 02:45 AM, Prica, Mihai wrote:
    <blockquote
cite="mid:97BD068FB200C44AA73C2B641F162ECF8FB2DC@IRSMSX101.ger.corp.intel.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      <meta name="Generator" content="Microsoft Word 14 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";
	color:black;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal"><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D">I
            didn&#8217;t know about the configuration fragments from the
            kernel tree. I&#8217;ll redo the patch to use those.
            <o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size: 11pt; font-family:
            &quot;Calibri&quot;,&quot;sans-serif&quot;; color: rgb(31,
            73, 125);">I see that the .cfg from the kernel tree enables
            kvm as modules. In this situation, I think I need to add an
            extra RRECOMMENDS with the necessary kernel-module-kvm to
            bring the necessary modules to the sysroot.&nbsp; Where would be
            the best places to add this, considering there is no
            specific recipe for kvm? I tried to add them to the image
            recipe but it didn&#8217;t worked.</span></p>
      </div>
    </blockquote>
    <br>
    It often to add below line in conf/machine/**.conf, I don't see it
    in meta-virt, Bruce may give some better comments <br>
    <br>
    MACHINE_EXTRA_RRECOMMENDS = "kernel-module-kvm"<br>
    <br>
    and need to make sure the kvm moudles built with "M" first<br>
    <br>
    Lei<br>
    <br>
    <br>
    <br>
    <blockquote
cite="mid:97BD068FB200C44AA73C2B641F162ECF8FB2DC@IRSMSX101.ger.corp.intel.com"
      type="cite">
      <div class="WordSection1">
        <p class="MsoNormal"><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p></o:p></span></p>
        <p class="MsoNormal"><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D">Thanks,<o:p></o:p></span></p>
        <p class="MsoNormal"><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D">Mihai<o:p></o:p></span></p>
        <p class="MsoNormal"><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
        <div style="border:none;border-left:solid blue 1.5pt;padding:0in
          0in 0in 4.0pt">
          <div>
            <div style="border:none;border-top:solid #B5C4DF
              1.0pt;padding:3.0pt 0in 0in 0in">
              <p class="MsoNormal"><b><span
style="font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:windowtext">From:</span></b><span
style="font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:windowtext">
                  <a class="moz-txt-link-abbreviated" href="mailto:meta-virtualization-bounces@yoctoproject.org">meta-virtualization-bounces@yoctoproject.org</a>
                  [<a class="moz-txt-link-freetext" href="mailto:meta-virtualization-bounces@yoctoproject.org">mailto:meta-virtualization-bounces@yoctoproject.org</a>]
                  <b>On Behalf Of </b>Raymond Danks<br>
                  <b>Sent:</b> Monday, January 07, 2013 8:32 PM<br>
                  <b>To:</b> Bruce Ashfield<br>
                  <b>Cc:</b> <a class="moz-txt-link-abbreviated" href="mailto:meta-virtualization@yoctoproject.org">meta-virtualization@yoctoproject.org</a><br>
                  <b>Subject:</b> Re: [meta-virtualization] [PATCH 1/2]
                  linux-yocto: added kernel configuration for KVM<o:p></o:p></span></p>
            </div>
          </div>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          <div>
            <p class="MsoNormal">On 01/07/2013 11:10 AM, Bruce Ashfield
              wrote:<o:p></o:p></p>
          </div>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <div>
              <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
              <div>
                <p class="MsoNormal" style="margin-bottom:12.0pt"><o:p>&nbsp;</o:p></p>
                <div>
                  <p class="MsoNormal">On Mon, Jan 7, 2013 at 12:26 PM,
                    Raymond Danks &lt;<a moz-do-not-send="true"
                      href="mailto:ray.danks@se-eng.com" target="_blank">ray.danks@se-eng.com</a>&gt;
                    wrote:<o:p></o:p></p>
                  <p class="MsoNormal">I'm going to show my lack of
                    knowledge in this area, but I know this is going to
                    come up when I push a xen.cfg that I apparently
                    never added.<br>
                    <br>
                    Is it possible to do something along the lines of
                    PACKAGE_CONFIG in the linux-yocto.bbappend? &nbsp;For
                    example, in the libvirt package one can use
                    PACKAGE_CONFIG to construct a "minimal" build of
                    libvirt. &nbsp;What would be the method for one to do the
                    same in this package?<o:p></o:p></p>
                  <div>
                    <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
                  </div>
                  <div>
                    <p class="MsoNormal">kernel configuration fragment
                      use are controlled via the KERNEL_FEATURES
                      variable, and<o:p></o:p></p>
                  </div>
                  <div>
                    <p class="MsoNormal">for anything pre-yocto 1.4 that
                      means an in-tree kernel configuration fragment
                      (I'm still pushing<o:p></o:p></p>
                  </div>
                  <div>
                    <p class="MsoNormal">for the fragments to be
                      maintained in tree, since that allows them to be
                      reused and maintained<o:p></o:p></p>
                  </div>
                  <div>
                    <p class="MsoNormal">more easily).<o:p></o:p></p>
                  </div>
                  <div>
                    <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
                  </div>
                  <div>
                    <p class="MsoNormal">KERNEL_FEATURES is managed like
                      any other variable in the system, including
                      updating<o:p></o:p></p>
                  </div>
                  <div>
                    <p class="MsoNormal">it via optional/dynamic
                      features as we see fit.<o:p></o:p></p>
                  </div>
                </div>
              </div>
            </div>
          </blockquote>
          <p class="MsoNormal"><br>
            Thanks Bruce.&nbsp; Yes, KERNEL_FEATURES is what I was looking
            for, I believe.&nbsp; I'm seeing some references and examples for
            this now.<br>
            <br>
            Ray<br>
            <br>
            <br>
            <o:p></o:p></p>
          <div>
            <div>
              <div>
                <div>
                  <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
                </div>
                <blockquote style="border:none;border-left:solid #CCCCCC
                  1.0pt;padding:0in 0in 0in
                  6.0pt;margin-left:4.8pt;margin-right:0in">
                  <p class="MsoNormal" style="margin-bottom:12.0pt"><br>
                    Yes, I imagine that worst case there can be a
                    SRC_URI_distro definition that includes only the
                    .scc files required for that "minimal" image build,
                    but it seems like we want to keep away from that as
                    much as possible being that this isn't a distro
                    layer.<o:p></o:p></p>
                </blockquote>
                <div>
                  <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
                </div>
                <div>
                  <p class="MsoNormal">Typically we do this via a base
                    KERNEL_FEATURES specification in the relevant
                    recipe(s), and<o:p></o:p></p>
                </div>
                <div>
                  <p class="MsoNormal">distros, or other configurations
                    can override/extend it as required.<o:p></o:p></p>
                </div>
                <div>
                  <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
                </div>
                <div>
                  <p class="MsoNormal">Cheers,<o:p></o:p></p>
                </div>
                <div>
                  <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
                </div>
                <div>
                  <p class="MsoNormal">Buce<o:p></o:p></p>
                </div>
                <div>
                  <p class="MsoNormal">&nbsp;<o:p></o:p></p>
                </div>
                <blockquote style="border:none;border-left:solid #CCCCCC
                  1.0pt;padding:0in 0in 0in
                  6.0pt;margin-left:4.8pt;margin-right:0in">
                  <p class="MsoNormal">Thanks,<br>
                    Ray <o:p></o:p></p>
                  <div>
                    <div>
                      <p class="MsoNormal"><br>
                        <br>
                        On 01/07/2013 05:08 AM, Mihai Prica wrote:<o:p></o:p></p>
                      <p class="MsoNormal">Signed-off-by: Mihai Prica
                        &lt;<a moz-do-not-send="true"
                          href="mailto:mihai.prica@intel.com"
                          target="_blank">mihai.prica@intel.com</a>&gt;<br>
                        ---<br>
                        &nbsp;
                        recipes-kernel/linux/linux-yocto/kvm-enable.scc
                        | &nbsp; &nbsp;4 ++++<br>
                        &nbsp; recipes-kernel/linux/linux-yocto/kvm.cfg &nbsp; &nbsp; &nbsp;
                        &nbsp;| &nbsp; &nbsp;4 ++++<br>
                        &nbsp; recipes-kernel/linux/linux-yocto_3.4.bbappend
                        &nbsp; | &nbsp; &nbsp;1 +<br>
                        &nbsp; 3 files changed, 9 insertions(+)<br>
                        &nbsp; create mode 100644
                        recipes-kernel/linux/linux-yocto/kvm-enable.scc<br>
                        &nbsp; create mode 100644
                        recipes-kernel/linux/linux-yocto/kvm.cfg<br>
                        <br>
                        diff --git
                        a/recipes-kernel/linux/linux-yocto/kvm-enable.scc
b/recipes-kernel/linux/linux-yocto/kvm-enable.scc<br>
                        new file mode 100644<br>
                        index 0000000..0b5f4fc<br>
                        --- /dev/null<br>
                        +++
                        b/recipes-kernel/linux/linux-yocto/kvm-enable.scc<br>
                        @@ -0,0 +1,4 @@<br>
                        +define KFEATURE_DESCRIPTION "Enable KVM host
                        support"<br>
                        +define KFEATURE_COMPATIBILITY board<br>
                        +<br>
                        +kconf non-hardware kvm.cfg<br>
                        diff --git
                        a/recipes-kernel/linux/linux-yocto/kvm.cfg
                        b/recipes-kernel/linux/linux-yocto/kvm.cfg<br>
                        new file mode 100644<br>
                        index 0000000..0cfcf58<br>
                        --- /dev/null<br>
                        +++ b/recipes-kernel/linux/linux-yocto/kvm.cfg<br>
                        @@ -0,0 +1,4 @@<br>
                        +CONFIG_KVM=y<br>
                        +CONFIG_KVM_INTEL=y<br>
                        +CONFIG_KVM_AMD=y<br>
                        +CONFIG_TUN=y<br>
                        diff --git
                        a/recipes-kernel/linux/linux-yocto_3.4.bbappend
                        b/recipes-kernel/linux/linux-yocto_3.4.bbappend<br>
                        index 5b163ff..71bead2 100644<br>
                        ---
                        a/recipes-kernel/linux/linux-yocto_3.4.bbappend<br>
                        +++
                        b/recipes-kernel/linux/linux-yocto_3.4.bbappend<br>
                        @@ -4,5 +4,6 @@ SRC_URI += "<a
                          moz-do-not-send="true"
                          href="file:///%5C%5Cxt-checksum.scc">file://xt-checksum.scc</a>
                        \<br>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a moz-do-not-send="true"
                          href="file:///%5C%5Cebtables.scc">file://ebtables.scc</a>
                        \<br>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a moz-do-not-send="true"
                          href="file:///%5C%5Cvswitch.scc">file://vswitch.scc</a>
                        \<br>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a moz-do-not-send="true"
                          href="file:///%5C%5Clxc.scc">file://lxc.scc</a>
                        \<br>
                        + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a moz-do-not-send="true"
                          href="file:///%5C%5Ckvm-enable.scc">file://kvm-enable.scc</a>
                        \<br>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "<br>
                        &nbsp; <o:p></o:p></p>
                      <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
                    </div>
                  </div>
                  <div>
                    <div>
                      <p class="MsoNormal">_______________________________________________<br>
                        meta-virtualization mailing list<br>
                        <a moz-do-not-send="true"
                          href="mailto:meta-virtualization@yoctoproject.org"
                          target="_blank">meta-virtualization@yoctoproject.org</a><br>
                        <a moz-do-not-send="true"
                          href="https://lists.yoctoproject.org/listinfo/meta-virtualization"
                          target="_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization</a><o:p></o:p></p>
                    </div>
                  </div>
                </blockquote>
              </div>
              <p class="MsoNormal"><br>
                <br clear="all">
                <o:p></o:p></p>
              <div>
                <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
              </div>
              <p class="MsoNormal">-- <br>
                "Thou shalt not follow the NULL pointer, for chaos and
                madness await thee at its end"
                <o:p></o:p></p>
            </div>
          </div>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
meta-virtualization mailing list
<a class="moz-txt-link-abbreviated" href="mailto:meta-virtualization@yoctoproject.org">meta-virtualization@yoctoproject.org</a>
<a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/listinfo/meta-virtualization">https://lists.yoctoproject.org/listinfo/meta-virtualization</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------090406000808090408030904--
