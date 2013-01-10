Return-Path: <Lei.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 22DD5E0047F
	for <meta-virtualization@yoctoproject.org>;
	Wed,  9 Jan 2013 23:31:51 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0A7VmSE001879
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Jan 2013 23:31:48 -0800 (PST)
Received: from [128.224.158.164] (128.224.158.164) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Wed, 9 Jan 2013 23:31:48 -0800
Message-ID: <50EE6E80.1090105@windriver.com>
Date: Thu, 10 Jan 2013 15:32:16 +0800
From: Lei Yang <lei.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: "Prica, Mihai" <mihai.prica@intel.com>
References: <1357560505-24122-1-git-send-email-mihai.prica@intel.com>
	<1357560505-24122-2-git-send-email-mihai.prica@intel.com>
	<50EB053F.2040809@se-eng.com>
	<CADkTA4NfJq0e-Kcg99uotS1O5ny0uQw=VVmKV0yxwwoMxqdNuw@mail.gmail.com>
	<50EB1486.4080901@se-eng.com>
	<97BD068FB200C44AA73C2B641F162ECF8FB2DC@IRSMSX101.ger.corp.intel.com>
	<CADkTA4NXx8pQQcvObPXQjST08BrQMWGZW-d-8kx4S3Mp7iUuOQ@mail.gmail.com>
	<97BD068FB200C44AA73C2B641F162ECF8FB671@IRSMSX101.ger.corp.intel.com>
In-Reply-To: <97BD068FB200C44AA73C2B641F162ECF8FB671@IRSMSX101.ger.corp.intel.com>
X-Originating-IP: [128.224.158.164]
X-Mailman-Approved-At: Mon, 14 Jan 2013 04:48:58 -0800
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
X-List-Received-Date: Thu, 10 Jan 2013 07:31:51 -0000
Content-Type: multipart/alternative;
	boundary="------------070408020902030900060604"

--------------070408020902030900060604
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/10/2013 03:43 AM, Prica, Mihai wrote:
>
> On Tue, Jan 8, 2013 at 1:45 PM, Prica, Mihai <mihai.prica@intel.com 
> <mailto:mihai.prica@intel.com>> wrote:
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
> You are presumably going to enable the in tree fragments by appending 
> to KERNEL_FEATURES
>
> in the linux-yocto_3.4.bbappend. Which to me, seems like the right 
> place to also add the
>
> RRECOMMENDS. Or had you tried this and it didn't work for some reason 
> I'm missing at the
>
> moment (it's late here, and I've spent all day hunting autobuilder 
> breakage) :)
>
> It doesn't work in the kernel recipe. I've talked with Richard and he 
> said PACKAGE_INSTALL_ATTEMPTONLY can
>
> be used for this in the image recipe. He said he will add a new 
> IMAGE_INSTALL_RECOMMEND option for this.
>
> There is however one more thing. Which is the best way to configure 
> the modules to be loaded at boot-time? I
>
> saw some discussion on the mailing list about update-modules becoming 
> obsolete.
>

I think "module_autoload_iwlwifi = "iwlwifi" " is your choice

Lei



> Thanks,
>
> Mihai
>
> Cheers,
>
> Bruce
>
>     Thanks,
>
>     Mihai
>
>     *From:*meta-virtualization-bounces@yoctoproject.org
>     <mailto:meta-virtualization-bounces@yoctoproject.org>
>     [mailto:meta-virtualization-bounces@yoctoproject.org
>     <mailto:meta-virtualization-bounces@yoctoproject.org>] *On Behalf
>     Of *Raymond Danks
>     *Sent:* Monday, January 07, 2013 8:32 PM
>     *To:* Bruce Ashfield
>     *Cc:* meta-virtualization@yoctoproject.org
>     <mailto:meta-virtualization@yoctoproject.org>
>     *Subject:* Re: [meta-virtualization] [PATCH 1/2] linux-yocto:
>     added kernel configuration for KVM
>
>     On 01/07/2013 11:10 AM, Bruce Ashfield wrote:
>
>         On Mon, Jan 7, 2013 at 12:26 PM, Raymond Danks
>         <ray.danks@se-eng.com <mailto:ray.danks@se-eng.com>> wrote:
>
>         I'm going to show my lack of knowledge in this area, but I
>         know this is going to come up when I push a xen.cfg that I
>         apparently never added.
>
>         Is it possible to do something along the lines of
>         PACKAGE_CONFIG in the linux-yocto.bbappend?  For example, in
>         the libvirt package one can use PACKAGE_CONFIG to construct a
>         "minimal" build of libvirt.  What would be the method for one
>         to do the same in this package?
>
>         kernel configuration fragment use are controlled via the
>         KERNEL_FEATURES variable, and
>
>         for anything pre-yocto 1.4 that means an in-tree kernel
>         configuration fragment (I'm still pushing
>
>         for the fragments to be maintained in tree, since that allows
>         them to be reused and maintained
>
>         more easily).
>
>         KERNEL_FEATURES is managed like any other variable in the
>         system, including updating
>
>         it via optional/dynamic features as we see fit.
>
>
>     Thanks Bruce.  Yes, KERNEL_FEATURES is what I was looking for, I
>     believe.  I'm seeing some references and examples for this now.
>
>     Ray
>
>
>         Yes, I imagine that worst case there can be a SRC_URI_distro
>         definition that includes only the .scc files required for that
>         "minimal" image build, but it seems like we want to keep away
>         from that as much as possible being that this isn't a distro
>         layer.
>
>     Typically we do this via a base KERNEL_FEATURES specification in
>     the relevant recipe(s), and
>
>     distros, or other configurations can override/extend it as required.
>
>     Cheers,
>
>     Buce
>
>         Thanks,
>         Ray
>
>
>
>         On 01/07/2013 05:08 AM, Mihai Prica wrote:
>
>         Signed-off-by: Mihai Prica <mihai.prica@intel.com
>         <mailto:mihai.prica@intel.com>>
>         ---
>           recipes-kernel/linux/linux-yocto/kvm-enable.scc |    4 ++++
>           recipes-kernel/linux/linux-yocto/kvm.cfg        |    4 ++++
>           recipes-kernel/linux/linux-yocto_3.4.bbappend   |    1 +
>           3 files changed, 9 insertions(+)
>           create mode 100644
>         recipes-kernel/linux/linux-yocto/kvm-enable.scc
>           create mode 100644 recipes-kernel/linux/linux-yocto/kvm.cfg
>
>         diff --git a/recipes-kernel/linux/linux-yocto/kvm-enable.scc
>         b/recipes-kernel/linux/linux-yocto/kvm-enable.scc
>         new file mode 100644
>         index 0000000..0b5f4fc
>         --- /dev/null
>         +++ b/recipes-kernel/linux/linux-yocto/kvm-enable.scc
>         @@ -0,0 +1,4 @@
>         +define KFEATURE_DESCRIPTION "Enable KVM host support"
>         +define KFEATURE_COMPATIBILITY board
>         +
>         +kconf non-hardware kvm.cfg
>         diff --git a/recipes-kernel/linux/linux-yocto/kvm.cfg
>         b/recipes-kernel/linux/linux-yocto/kvm.cfg
>         new file mode 100644
>         index 0000000..0cfcf58
>         --- /dev/null
>         +++ b/recipes-kernel/linux/linux-yocto/kvm.cfg
>         @@ -0,0 +1,4 @@
>         +CONFIG_KVM=y
>         +CONFIG_KVM_INTEL=y
>         +CONFIG_KVM_AMD=y
>         +CONFIG_TUN=y
>         diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend
>         b/recipes-kernel/linux/linux-yocto_3.4.bbappend
>         index 5b163ff..71bead2 100644
>         --- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
>         +++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
>         @@ -4,5 +4,6 @@ SRC_URI += "file://xt-checksum.scc \
>                       file://ebtables.scc \
>                     file://vswitch.scc \
>                     file://lxc.scc \
>         +            file://kvm-enable.scc \
>         <file:///%5C%5Cxt-checksum.scc%20%5C%0b%A0%20%A0%20%A0%20%A0%20%A0%20%A0%20%A0%20file:%5Cebtables.scc%20%5C%0b%A0%20%A0%20%A0%20%A0%20%A0%20%A0%20file:%5Cvswitch.scc%20%5C%0b%A0%20%A0%20%A0%20%A0%20%A0%20%A0%20file:%5Clxc.scc%20%5C%0b+%20%A0%20%A0%20%A0%20%A0%20%A0%20%A0file:%5Ckvm-enable.scc%20%5C%0b%A0%20%A0%20%A0%20%A0%20%A0%20%A0%20>"
>
>         _______________________________________________
>         meta-virtualization mailing list
>         meta-virtualization@yoctoproject.org
>         <mailto:meta-virtualization@yoctoproject.org>
>         https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
>     -- 
>     "Thou shalt not follow the NULL pointer, for chaos and madness
>     await thee at its end"
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


--------------070408020902030900060604
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    On 01/10/2013 03:43 AM, Prica, Mihai wrote:
    <blockquote
cite="mid:97BD068FB200C44AA73C2B641F162ECF8FB671@IRSMSX101.ger.corp.intel.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      <meta name="ProgId" content="Word.Document">
      <meta name="Generator" content="Microsoft Word 14">
      <meta name="Originator" content="Microsoft Word 14">
      <link rel="File-List" href="cid:filelist.xml@01CDEEB2.64F61290">
      <!--[if gte mso 9]><xml>
<o:OfficeDocumentSettings>
<o:AllowPNG/>
<o:DoNotRelyOnCSS/>
</o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
<w:WordDocument>
<w:SpellingState>Clean</w:SpellingState>
<w:TrackMoves/>
<w:TrackFormatting/>
<w:EnvelopeVis/>
<w:ValidateAgainstSchemas/>
<w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
<w:IgnoreMixedContent>false</w:IgnoreMixedContent>
<w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
<w:DoNotPromoteQF/>
<w:LidThemeOther>EN-US</w:LidThemeOther>
<w:LidThemeAsian>X-NONE</w:LidThemeAsian>
<w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
<w:Compatibility>
<w:DoNotExpandShiftReturn/>
<w:BreakWrappedTables/>
<w:SplitPgBreakAndParaMark/>
<w:EnableOpenTypeKerning/>
</w:Compatibility>
<m:mathPr>
<m:mathFont m:val="Cambria Math"/>
<m:brkBin m:val="before"/>
<m:brkBinSub m:val="&#45;-"/>
<m:smallFrac m:val="off"/>
<m:dispDef/>
<m:lMargin m:val="0"/>
<m:rMargin m:val="0"/>
<m:defJc m:val="centerGroup"/>
<m:wrapIndent m:val="1440"/>
<m:intLim m:val="subSup"/>
<m:naryLim m:val="undOvr"/>
</m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
<w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="true" DefSemiHidden="true" DefQFormat="false" DefPriority="99" LatentStyleCount="267">
<w:LsdException Locked="false" Priority="0" SemiHidden="false" UnhideWhenUsed="false" QFormat="true" Name="Normal"/>
<w:LsdException Locked="false" Priority="9" SemiHidden="false" UnhideWhenUsed="false" QFormat="true" Name="heading 1"/>
<w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 2"/>
<w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 3"/>
<w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 4"/>
<w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 5"/>
<w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 6"/>
<w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 7"/>
<w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 8"/>
<w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 9"/>
<w:LsdException Locked="false" Priority="39" Name="toc 1"/>
<w:LsdException Locked="false" Priority="39" Name="toc 2"/>
<w:LsdException Locked="false" Priority="39" Name="toc 3"/>
<w:LsdException Locked="false" Priority="39" Name="toc 4"/>
<w:LsdException Locked="false" Priority="39" Name="toc 5"/>
<w:LsdException Locked="false" Priority="39" Name="toc 6"/>
<w:LsdException Locked="false" Priority="39" Name="toc 7"/>
<w:LsdException Locked="false" Priority="39" Name="toc 8"/>
<w:LsdException Locked="false" Priority="39" Name="toc 9"/>
<w:LsdException Locked="false" Priority="35" QFormat="true" Name="caption"/>
<w:LsdException Locked="false" Priority="10" SemiHidden="false" UnhideWhenUsed="false" QFormat="true" Name="Title"/>
<w:LsdException Locked="false" Priority="1" Name="Default Paragraph Font"/>
<w:LsdException Locked="false" Priority="11" SemiHidden="false" UnhideWhenUsed="false" QFormat="true" Name="Subtitle"/>
<w:LsdException Locked="false" Priority="22" SemiHidden="false" UnhideWhenUsed="false" QFormat="true" Name="Strong"/>
<w:LsdException Locked="false" Priority="20" SemiHidden="false" UnhideWhenUsed="false" QFormat="true" Name="Emphasis"/>
<w:LsdException Locked="false" Priority="59" SemiHidden="false" UnhideWhenUsed="false" Name="Table Grid"/>
<w:LsdException Locked="false" UnhideWhenUsed="false" Name="Placeholder Text"/>
<w:LsdException Locked="false" Priority="1" SemiHidden="false" UnhideWhenUsed="false" QFormat="true" Name="No Spacing"/>
<w:LsdException Locked="false" Priority="60" SemiHidden="false" UnhideWhenUsed="false" Name="Light Shading"/>
<w:LsdException Locked="false" Priority="61" SemiHidden="false" UnhideWhenUsed="false" Name="Light List"/>
<w:LsdException Locked="false" Priority="62" SemiHidden="false" UnhideWhenUsed="false" Name="Light Grid"/>
<w:LsdException Locked="false" Priority="63" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Shading 1"/>
<w:LsdException Locked="false" Priority="64" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Shading 2"/>
<w:LsdException Locked="false" Priority="65" SemiHidden="false" UnhideWhenUsed="false" Name="Medium List 1"/>
<w:LsdException Locked="false" Priority="66" SemiHidden="false" UnhideWhenUsed="false" Name="Medium List 2"/>
<w:LsdException Locked="false" Priority="67" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Grid 1"/>
<w:LsdException Locked="false" Priority="68" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Grid 2"/>
<w:LsdException Locked="false" Priority="69" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Grid 3"/>
<w:LsdException Locked="false" Priority="70" SemiHidden="false" UnhideWhenUsed="false" Name="Dark List"/>
<w:LsdException Locked="false" Priority="71" SemiHidden="false" UnhideWhenUsed="false" Name="Colorful Shading"/>
<w:LsdException Locked="false" Priority="72" SemiHidden="false" UnhideWhenUsed="false" Name="Colorful List"/>
<w:LsdException Locked="false" Priority="73" SemiHidden="false" UnhideWhenUsed="false" Name="Colorful Grid"/>
<w:LsdException Locked="false" Priority="60" SemiHidden="false" UnhideWhenUsed="false" Name="Light Shading Accent 1"/>
<w:LsdException Locked="false" Priority="61" SemiHidden="false" UnhideWhenUsed="false" Name="Light List Accent 1"/>
<w:LsdException Locked="false" Priority="62" SemiHidden="false" UnhideWhenUsed="false" Name="Light Grid Accent 1"/>
<w:LsdException Locked="false" Priority="63" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Shading 1 Accent 1"/>
<w:LsdException Locked="false" Priority="64" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Shading 2 Accent 1"/>
<w:LsdException Locked="false" Priority="65" SemiHidden="false" UnhideWhenUsed="false" Name="Medium List 1 Accent 1"/>
<w:LsdException Locked="false" UnhideWhenUsed="false" Name="Revision"/>
<w:LsdException Locked="false" Priority="34" SemiHidden="false" UnhideWhenUsed="false" QFormat="true" Name="List Paragraph"/>
<w:LsdException Locked="false" Priority="29" SemiHidden="false" UnhideWhenUsed="false" QFormat="true" Name="Quote"/>
<w:LsdException Locked="false" Priority="30" SemiHidden="false" UnhideWhenUsed="false" QFormat="true" Name="Intense Quote"/>
<w:LsdException Locked="false" Priority="66" SemiHidden="false" UnhideWhenUsed="false" Name="Medium List 2 Accent 1"/>
<w:LsdException Locked="false" Priority="67" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Grid 1 Accent 1"/>
<w:LsdException Locked="false" Priority="68" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Grid 2 Accent 1"/>
<w:LsdException Locked="false" Priority="69" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Grid 3 Accent 1"/>
<w:LsdException Locked="false" Priority="70" SemiHidden="false" UnhideWhenUsed="false" Name="Dark List Accent 1"/>
<w:LsdException Locked="false" Priority="71" SemiHidden="false" UnhideWhenUsed="false" Name="Colorful Shading Accent 1"/>
<w:LsdException Locked="false" Priority="72" SemiHidden="false" UnhideWhenUsed="false" Name="Colorful List Accent 1"/>
<w:LsdException Locked="false" Priority="73" SemiHidden="false" UnhideWhenUsed="false" Name="Colorful Grid Accent 1"/>
<w:LsdException Locked="false" Priority="60" SemiHidden="false" UnhideWhenUsed="false" Name="Light Shading Accent 2"/>
<w:LsdException Locked="false" Priority="61" SemiHidden="false" UnhideWhenUsed="false" Name="Light List Accent 2"/>
<w:LsdException Locked="false" Priority="62" SemiHidden="false" UnhideWhenUsed="false" Name="Light Grid Accent 2"/>
<w:LsdException Locked="false" Priority="63" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Shading 1 Accent 2"/>
<w:LsdException Locked="false" Priority="64" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Shading 2 Accent 2"/>
<w:LsdException Locked="false" Priority="65" SemiHidden="false" UnhideWhenUsed="false" Name="Medium List 1 Accent 2"/>
<w:LsdException Locked="false" Priority="66" SemiHidden="false" UnhideWhenUsed="false" Name="Medium List 2 Accent 2"/>
<w:LsdException Locked="false" Priority="67" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Grid 1 Accent 2"/>
<w:LsdException Locked="false" Priority="68" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Grid 2 Accent 2"/>
<w:LsdException Locked="false" Priority="69" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Grid 3 Accent 2"/>
<w:LsdException Locked="false" Priority="70" SemiHidden="false" UnhideWhenUsed="false" Name="Dark List Accent 2"/>
<w:LsdException Locked="false" Priority="71" SemiHidden="false" UnhideWhenUsed="false" Name="Colorful Shading Accent 2"/>
<w:LsdException Locked="false" Priority="72" SemiHidden="false" UnhideWhenUsed="false" Name="Colorful List Accent 2"/>
<w:LsdException Locked="false" Priority="73" SemiHidden="false" UnhideWhenUsed="false" Name="Colorful Grid Accent 2"/>
<w:LsdException Locked="false" Priority="60" SemiHidden="false" UnhideWhenUsed="false" Name="Light Shading Accent 3"/>
<w:LsdException Locked="false" Priority="61" SemiHidden="false" UnhideWhenUsed="false" Name="Light List Accent 3"/>
<w:LsdException Locked="false" Priority="62" SemiHidden="false" UnhideWhenUsed="false" Name="Light Grid Accent 3"/>
<w:LsdException Locked="false" Priority="63" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Shading 1 Accent 3"/>
<w:LsdException Locked="false" Priority="64" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Shading 2 Accent 3"/>
<w:LsdException Locked="false" Priority="65" SemiHidden="false" UnhideWhenUsed="false" Name="Medium List 1 Accent 3"/>
<w:LsdException Locked="false" Priority="66" SemiHidden="false" UnhideWhenUsed="false" Name="Medium List 2 Accent 3"/>
<w:LsdException Locked="false" Priority="67" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Grid 1 Accent 3"/>
<w:LsdException Locked="false" Priority="68" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Grid 2 Accent 3"/>
<w:LsdException Locked="false" Priority="69" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Grid 3 Accent 3"/>
<w:LsdException Locked="false" Priority="70" SemiHidden="false" UnhideWhenUsed="false" Name="Dark List Accent 3"/>
<w:LsdException Locked="false" Priority="71" SemiHidden="false" UnhideWhenUsed="false" Name="Colorful Shading Accent 3"/>
<w:LsdException Locked="false" Priority="72" SemiHidden="false" UnhideWhenUsed="false" Name="Colorful List Accent 3"/>
<w:LsdException Locked="false" Priority="73" SemiHidden="false" UnhideWhenUsed="false" Name="Colorful Grid Accent 3"/>
<w:LsdException Locked="false" Priority="60" SemiHidden="false" UnhideWhenUsed="false" Name="Light Shading Accent 4"/>
<w:LsdException Locked="false" Priority="61" SemiHidden="false" UnhideWhenUsed="false" Name="Light List Accent 4"/>
<w:LsdException Locked="false" Priority="62" SemiHidden="false" UnhideWhenUsed="false" Name="Light Grid Accent 4"/>
<w:LsdException Locked="false" Priority="63" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Shading 1 Accent 4"/>
<w:LsdException Locked="false" Priority="64" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Shading 2 Accent 4"/>
<w:LsdException Locked="false" Priority="65" SemiHidden="false" UnhideWhenUsed="false" Name="Medium List 1 Accent 4"/>
<w:LsdException Locked="false" Priority="66" SemiHidden="false" UnhideWhenUsed="false" Name="Medium List 2 Accent 4"/>
<w:LsdException Locked="false" Priority="67" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Grid 1 Accent 4"/>
<w:LsdException Locked="false" Priority="68" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Grid 2 Accent 4"/>
<w:LsdException Locked="false" Priority="69" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Grid 3 Accent 4"/>
<w:LsdException Locked="false" Priority="70" SemiHidden="false" UnhideWhenUsed="false" Name="Dark List Accent 4"/>
<w:LsdException Locked="false" Priority="71" SemiHidden="false" UnhideWhenUsed="false" Name="Colorful Shading Accent 4"/>
<w:LsdException Locked="false" Priority="72" SemiHidden="false" UnhideWhenUsed="false" Name="Colorful List Accent 4"/>
<w:LsdException Locked="false" Priority="73" SemiHidden="false" UnhideWhenUsed="false" Name="Colorful Grid Accent 4"/>
<w:LsdException Locked="false" Priority="60" SemiHidden="false" UnhideWhenUsed="false" Name="Light Shading Accent 5"/>
<w:LsdException Locked="false" Priority="61" SemiHidden="false" UnhideWhenUsed="false" Name="Light List Accent 5"/>
<w:LsdException Locked="false" Priority="62" SemiHidden="false" UnhideWhenUsed="false" Name="Light Grid Accent 5"/>
<w:LsdException Locked="false" Priority="63" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Shading 1 Accent 5"/>
<w:LsdException Locked="false" Priority="64" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Shading 2 Accent 5"/>
<w:LsdException Locked="false" Priority="65" SemiHidden="false" UnhideWhenUsed="false" Name="Medium List 1 Accent 5"/>
<w:LsdException Locked="false" Priority="66" SemiHidden="false" UnhideWhenUsed="false" Name="Medium List 2 Accent 5"/>
<w:LsdException Locked="false" Priority="67" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Grid 1 Accent 5"/>
<w:LsdException Locked="false" Priority="68" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Grid 2 Accent 5"/>
<w:LsdException Locked="false" Priority="69" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Grid 3 Accent 5"/>
<w:LsdException Locked="false" Priority="70" SemiHidden="false" UnhideWhenUsed="false" Name="Dark List Accent 5"/>
<w:LsdException Locked="false" Priority="71" SemiHidden="false" UnhideWhenUsed="false" Name="Colorful Shading Accent 5"/>
<w:LsdException Locked="false" Priority="72" SemiHidden="false" UnhideWhenUsed="false" Name="Colorful List Accent 5"/>
<w:LsdException Locked="false" Priority="73" SemiHidden="false" UnhideWhenUsed="false" Name="Colorful Grid Accent 5"/>
<w:LsdException Locked="false" Priority="60" SemiHidden="false" UnhideWhenUsed="false" Name="Light Shading Accent 6"/>
<w:LsdException Locked="false" Priority="61" SemiHidden="false" UnhideWhenUsed="false" Name="Light List Accent 6"/>
<w:LsdException Locked="false" Priority="62" SemiHidden="false" UnhideWhenUsed="false" Name="Light Grid Accent 6"/>
<w:LsdException Locked="false" Priority="63" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Shading 1 Accent 6"/>
<w:LsdException Locked="false" Priority="64" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Shading 2 Accent 6"/>
<w:LsdException Locked="false" Priority="65" SemiHidden="false" UnhideWhenUsed="false" Name="Medium List 1 Accent 6"/>
<w:LsdException Locked="false" Priority="66" SemiHidden="false" UnhideWhenUsed="false" Name="Medium List 2 Accent 6"/>
<w:LsdException Locked="false" Priority="67" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Grid 1 Accent 6"/>
<w:LsdException Locked="false" Priority="68" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Grid 2 Accent 6"/>
<w:LsdException Locked="false" Priority="69" SemiHidden="false" UnhideWhenUsed="false" Name="Medium Grid 3 Accent 6"/>
<w:LsdException Locked="false" Priority="70" SemiHidden="false" UnhideWhenUsed="false" Name="Dark List Accent 6"/>
<w:LsdException Locked="false" Priority="71" SemiHidden="false" UnhideWhenUsed="false" Name="Colorful Shading Accent 6"/>
<w:LsdException Locked="false" Priority="72" SemiHidden="false" UnhideWhenUsed="false" Name="Colorful List Accent 6"/>
<w:LsdException Locked="false" Priority="73" SemiHidden="false" UnhideWhenUsed="false" Name="Colorful Grid Accent 6"/>
<w:LsdException Locked="false" Priority="19" SemiHidden="false" UnhideWhenUsed="false" QFormat="true" Name="Subtle Emphasis"/>
<w:LsdException Locked="false" Priority="21" SemiHidden="false" UnhideWhenUsed="false" QFormat="true" Name="Intense Emphasis"/>
<w:LsdException Locked="false" Priority="31" SemiHidden="false" UnhideWhenUsed="false" QFormat="true" Name="Subtle Reference"/>
<w:LsdException Locked="false" Priority="32" SemiHidden="false" UnhideWhenUsed="false" QFormat="true" Name="Intense Reference"/>
<w:LsdException Locked="false" Priority="33" SemiHidden="false" UnhideWhenUsed="false" QFormat="true" Name="Book Title"/>
<w:LsdException Locked="false" Priority="37" Name="Bibliography"/>
<w:LsdException Locked="false" Priority="39" QFormat="true" Name="TOC Heading"/>
</w:LatentStyles>
</xml><![endif]-->
      <style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:-520092929 1073786111 9 0 415 0;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:-520081665 -1073717157 41 0 66047 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-parent:"";
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";
	mso-fareast-font-family:Calibri;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;
	text-underline:single;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-noshow:yes;
	mso-style-priority:99;
	color:purple;
	text-decoration:underline;
	text-underline:single;}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";
	mso-fareast-font-family:Calibri;}
span.EmailStyle17
	{mso-style-type:personal-reply;
	mso-style-noshow:yes;
	mso-style-unhide:no;
	mso-ansi-font-size:11.0pt;
	mso-bidi-font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-fareast-font-family:Calibri;
	mso-hansi-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";
	color:#1F497D;}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-unhide:no;
	mso-style-locked:yes;
	mso-style-link:"Balloon Text";
	mso-ansi-font-size:8.0pt;
	mso-bidi-font-size:8.0pt;
	font-family:"Tahoma","sans-serif";
	mso-ascii-font-family:Tahoma;
	mso-hansi-font-family:Tahoma;
	mso-bidi-font-family:Tahoma;}
span.SpellE
	{mso-style-name:"";
	mso-spl-e:yes;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-default-props:yes;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-fareast-font-family:Calibri;
	mso-hansi-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
	mso-paper-source:0;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 10]><style>/* Style Definitions */
table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin:0in;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-hansi-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";}
</style><![endif]--><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <div>
          <div>
            <div>
              <p class="MsoNormal" style="margin-left:.5in"><font
                  face="Times New Roman" size="3"><span
                    style="font-size:12.0pt">On Tue, Jan 8, 2013 at 1:45
                    PM, Prica, Mihai &lt;<a moz-do-not-send="true"
                      href="mailto:mihai.prica@intel.com"
                      target="_blank">mihai.prica@intel.com</a>&gt;
                    wrote:<o:p></o:p></span></font></p>
              <div>
                <div>
                  <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                      color="#1f497d" face="Calibri" size="2"><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D">&nbsp;</span></font><o:p></o:p></p>
                  <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                      color="#1f497d" face="Calibri" size="2"><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D">I
                        didn&#8217;t know about the configuration fragments
                        from the kernel tree. I&#8217;ll redo the patch to use
                        those.
                      </span></font><o:p></o:p></p>
                  <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                      color="#1f497d" face="Calibri" size="2"><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D">I
                        see that the .<span class="SpellE">cfg</span>
                        from the kernel tree enables
                        <span class="SpellE">kvm</span> as modules. In
                        this situation, I think I need to add an extra
                        RRECOMMENDS with the necessary kernel-module-<span
                          class="SpellE">kvm</span> to bring the
                        necessary modules to the
                        <span class="SpellE">sysroot</span>.&nbsp; Where
                        would be the best places to add this,
                        considering there is no specific recipe for
                        <span class="SpellE">kvm</span>? I tried to add
                        them to the image recipe but it didn&#8217;t worked.</span></font><o:p></o:p></p>
                </div>
              </div>
              <div>
                <p class="MsoNormal" style="margin-left:.5in"><font
                    face="Times New Roman" size="3"><span
                      style="font-size:12.0pt"><o:p>&nbsp;</o:p></span></font></p>
              </div>
              <div>
                <p class="MsoNormal" style="margin-left:.5in"><font
                    face="Times New Roman" size="3"><span
                      style="font-size:12.0pt"><o:p>&nbsp;</o:p></span></font></p>
              </div>
              <div>
                <p class="MsoNormal" style="margin-left:.5in"><font
                    face="Times New Roman" size="3"><span
                      style="font-size:12.0pt">You are presumably going
                      to enable the in tree fragments by appending to
                      KERNEL_FEATURES<o:p></o:p></span></font></p>
              </div>
              <div>
                <p class="MsoNormal" style="margin-left:.5in"><font
                    face="Times New Roman" size="3"><span
                      style="font-size:12.0pt">in the
                      linux-yocto_3.4.bbappend. Which to me, seems like
                      the right place to also add the<o:p></o:p></span></font></p>
              </div>
              <div>
                <p class="MsoNormal" style="margin-left:.5in"><font
                    face="Times New Roman" size="3"><span
                      style="font-size:12.0pt">RRECOMMENDS. Or had you
                      tried this and it didn't work for some reason I'm
                      missing at the<o:p></o:p></span></font></p>
              </div>
              <div>
                <p class="MsoNormal" style="margin-left:.5in"><font
                    face="Times New Roman" size="3"><span
                      style="font-size:12.0pt">moment (it's late here,
                      and I've spent all day hunting
                      <span class="SpellE">autobuilder</span> breakage)
                      :)<o:p></o:p></span></font></p>
                <p class="MsoNormal"><font color="#1f497d"
                    face="Calibri" size="2"><span
                      style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-bidi-font-family:&quot;Times
                      New Roman&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span></font></p>
                <p class="MsoNormal"><font face="Calibri" size="2"><span
                      style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-bidi-font-family:&quot;Times
                      New Roman&quot;">It doesn&#8217;t work in the kernel
                      recipe. I&#8217;ve talked with Richard and he said
                      PACKAGE_INSTALL_ATTEMPTONLY can <o:p></o:p></span></font></p>
                <p class="MsoNormal"><font face="Calibri" size="2"><span
                      style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-bidi-font-family:&quot;Times
                      New Roman&quot;">be used for this in the image
                      recipe. He said he will add a new
                      IMAGE_INSTALL_RECOMMEND option for this.
                      <o:p></o:p></span></font></p>
                <p class="MsoNormal"><font face="Calibri" size="2"><span
                      style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-bidi-font-family:&quot;Times
                      New Roman&quot;"><o:p>&nbsp;</o:p></span></font></p>
                <p class="MsoNormal"><font face="Calibri" size="2"><span
                      style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-bidi-font-family:&quot;Times
                      New Roman&quot;">There is however one more thing.
                      Which is the best way to configure the modules to
                      be loaded at boot-time? I<o:p></o:p></span></font></p>
                <p class="MsoNormal"><font face="Calibri" size="2"><span
                      style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-bidi-font-family:&quot;Times
                      New Roman&quot;">saw some discussion on the
                      mailing list about update-modules becoming
                      obsolete.<o:p></o:p></span></font></p>
                <p class="MsoNormal"><font face="Calibri" size="2"><span
                      style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-bidi-font-family:&quot;Times
                      New Roman&quot;"><o:p>&nbsp;</o:p></span></font></p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    I think "module_autoload_iwlwifi = "iwlwifi" " is your choice <br>
    <br>
    Lei<br>
    &nbsp;<br>
    <br>
    <br>
    <blockquote
cite="mid:97BD068FB200C44AA73C2B641F162ECF8FB671@IRSMSX101.ger.corp.intel.com"
      type="cite">
      <div class="WordSection1">
        <div>
          <div>
            <div>
              <div>
                <p class="MsoNormal"><font face="Calibri" size="2"><span
                      style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-bidi-font-family:&quot;Times
                      New Roman&quot;">Thanks,<o:p></o:p></span></font></p>
                <p class="MsoNormal"><font face="Calibri" size="2"><span
                      style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-bidi-font-family:&quot;Times
                      New Roman&quot;">Mihai<o:p></o:p></span></font></p>
              </div>
              <div>
                <p class="MsoNormal" style="margin-left:.5in"><font
                    face="Times New Roman" size="3"><span
                      style="font-size:12.0pt"><o:p>&nbsp;</o:p></span></font></p>
              </div>
              <div>
                <p class="MsoNormal" style="margin-left:.5in"><font
                    face="Times New Roman" size="3"><span
                      style="font-size:12.0pt">Cheers,<o:p></o:p></span></font></p>
              </div>
              <div>
                <p class="MsoNormal" style="margin-left:.5in"><font
                    face="Times New Roman" size="3"><span
                      style="font-size:12.0pt"><o:p>&nbsp;</o:p></span></font></p>
              </div>
              <div>
                <p class="MsoNormal" style="margin-left:.5in"><font
                    face="Times New Roman" size="3"><span
                      style="font-size:12.0pt">Bruce<o:p></o:p></span></font></p>
              </div>
              <div>
                <p class="MsoNormal" style="margin-left:.5in"><font
                    face="Times New Roman" size="3"><span
                      style="font-size:12.0pt">&nbsp;<o:p></o:p></span></font></p>
              </div>
              <blockquote style="border:none;border-left:solid #CCCCCC
                1.0pt;mso-border-left-alt:solid #CCCCCC
                .75pt;padding:0in 0in 0in
                6.0pt;margin-left:4.8pt;margin-right:0in">
                <div>
                  <div>
                    <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                        color="#1f497d" face="Calibri" size="2"><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D">&nbsp;</span></font><o:p></o:p></p>
                    <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                        color="#1f497d" face="Calibri" size="2"><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D">Thanks,</span></font><o:p></o:p></p>
                    <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                        color="#1f497d" face="Calibri" size="2"><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D">Mihai</span></font><o:p></o:p></p>
                    <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                        color="#1f497d" face="Calibri" size="2"><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D">&nbsp;</span></font><o:p></o:p></p>
                    <div style="border:none;border-left:solid blue
                      1.5pt;padding:0in 0in 0in 4.0pt">
                      <div>
                        <div style="border:none;border-top:solid #B5C4DF
                          1.0pt;padding:3.0pt 0in 0in 0in">
                          <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in;mso-outline-level:1"><b><font
                                face="Tahoma" size="2"><span
style="font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;font-weight:bold">From:</span></font></b><font
                              face="Tahoma" size="2"><span
style="font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"><a
                                  moz-do-not-send="true"
                                  href="mailto:meta-virtualization-bounces@yoctoproject.org"
                                  target="_blank">meta-virtualization-bounces@yoctoproject.org</a>
                                [mailto:<a moz-do-not-send="true"
                                  href="mailto:meta-virtualization-bounces@yoctoproject.org"
                                  target="_blank">meta-virtualization-bounces@yoctoproject.org</a>]
                                <b><span style="font-weight:bold">On
                                    Behalf Of </span></b>Raymond <span
                                  class="SpellE">
                                  Danks</span><br>
                                <b><span style="font-weight:bold">Sent:</span></b>
                                Monday, January 07, 2013 8:32 PM<br>
                                <b><span style="font-weight:bold">To:</span></b>
                                Bruce Ashfield<br>
                                <b><span style="font-weight:bold">Cc:</span></b>
                                <a moz-do-not-send="true"
                                  href="mailto:meta-virtualization@yoctoproject.org"
                                  target="_blank">
                                  meta-virtualization@yoctoproject.org</a><br>
                                <b><span style="font-weight:bold">Subject:</span></b>
                                Re: [meta-virtualization] [PATCH 1/2]
                                <span class="SpellE">linux-yocto</span>:
                                added kernel configuration for KVM</span></font><o:p></o:p></p>
                        </div>
                      </div>
                      <div>
                        <div>
                          <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                              face="Times New Roman" size="3"><span
                                style="font-size:12.0pt">&nbsp;<o:p></o:p></span></font></p>
                          <div>
                            <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                                face="Times New Roman" size="3"><span
                                  style="font-size:12.0pt">On 01/07/2013
                                  11:10 AM, Bruce Ashfield wrote:<o:p></o:p></span></font></p>
                          </div>
                          <blockquote
                            style="margin-top:5.0pt;margin-bottom:5.0pt">
                            <div>
                              <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                                  face="Times New Roman" size="3"><span
                                    style="font-size:12.0pt">&nbsp;<o:p></o:p></span></font></p>
                              <div>
                                <p class="MsoNormal"
                                  style="mso-margin-top-alt:auto;margin-bottom:12.0pt;margin-left:.5in">
                                  <font face="Times New Roman" size="3"><span
                                      style="font-size:12.0pt">&nbsp;<o:p></o:p></span></font></p>
                                <div>
                                  <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                                      face="Times New Roman" size="3"><span
                                        style="font-size:12.0pt">On Mon,
                                        Jan 7, 2013 at 12:26 PM, Raymond
                                        <span class="SpellE">Danks</span>
                                        &lt;<a moz-do-not-send="true"
                                          href="mailto:ray.danks@se-eng.com"
                                          target="_blank">ray.danks@se-eng.com</a>&gt;
                                        wrote:<o:p></o:p></span></font></p>
                                  <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                                      face="Times New Roman" size="3"><span
                                        style="font-size:12.0pt">I'm
                                        going to show my lack of
                                        knowledge in this area, but I
                                        know this is going to come up
                                        when I push a
                                        <span class="SpellE">xen.cfg</span>
                                        that I apparently never added.<br>
                                        <br>
                                        Is it possible to do something
                                        along the lines of
                                        PACKAGE_CONFIG in the <span
                                          class="SpellE">
                                          linux-yocto.bbappend</span>?
                                        &nbsp;For example, in the <span
                                          class="SpellE">libvirt</span>
                                        package one can use
                                        PACKAGE_CONFIG to construct a
                                        "minimal" build of
                                        <span class="SpellE">libvirt</span>.
                                        &nbsp;What would be the method for
                                        one to do the same in this
                                        package?<o:p></o:p></span></font></p>
                                  <div>
                                    <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                                        face="Times New Roman" size="3"><span
                                          style="font-size:12.0pt">&nbsp;<o:p></o:p></span></font></p>
                                  </div>
                                  <div>
                                    <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                                        face="Times New Roman" size="3"><span
                                          style="font-size:12.0pt">kernel
                                          configuration fragment use are
                                          controlled via the
                                          KERNEL_FEATURES variable, and<o:p></o:p></span></font></p>
                                  </div>
                                  <div>
                                    <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                                        face="Times New Roman" size="3"><span
                                          style="font-size:12.0pt">for
                                          anything pre-<span
                                            class="SpellE">yocto</span>
                                          1.4 that means an in-tree
                                          kernel configuration fragment
                                          (I'm still pushing<o:p></o:p></span></font></p>
                                  </div>
                                  <div>
                                    <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                                        face="Times New Roman" size="3"><span
                                          style="font-size:12.0pt">for
                                          the fragments to be maintained
                                          in tree, since that allows
                                          them to be reused and
                                          maintained<o:p></o:p></span></font></p>
                                  </div>
                                  <div>
                                    <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                                        face="Times New Roman" size="3"><span
                                          style="font-size:12.0pt">more
                                          easily).<o:p></o:p></span></font></p>
                                  </div>
                                  <div>
                                    <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                                        face="Times New Roman" size="3"><span
                                          style="font-size:12.0pt">&nbsp;<o:p></o:p></span></font></p>
                                  </div>
                                  <div>
                                    <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                                        face="Times New Roman" size="3"><span
                                          style="font-size:12.0pt">KERNEL_FEATURES
                                          is managed like any other
                                          variable in the system,
                                          including updating<o:p></o:p></span></font></p>
                                  </div>
                                  <div>
                                    <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                                        face="Times New Roman" size="3"><span
                                          style="font-size:12.0pt">it
                                          via optional/dynamic features
                                          as we see fit.<o:p></o:p></span></font></p>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </blockquote>
                          <p class="MsoNormal"
                            style="mso-margin-top-alt:auto;margin-bottom:12.0pt;margin-left:.5in">
                            <font face="Times New Roman" size="3"><span
                                style="font-size:12.0pt"><br>
                                Thanks Bruce.&nbsp; Yes, KERNEL_FEATURES is
                                what I was looking for, I believe.&nbsp; I'm
                                seeing some references and examples for
                                this now.<br>
                                <br>
                                Ray<br
                                  style="mso-special-character:line-break">
                                <!--[if !supportLineBreakNewLine]--><br
style="mso-special-character:line-break">
                                <!--[endif]--><o:p></o:p></span></font></p>
                          <div>
                            <div>
                              <div>
                                <div>
                                  <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                                      face="Times New Roman" size="3"><span
                                        style="font-size:12.0pt">&nbsp;<o:p></o:p></span></font></p>
                                </div>
                                <blockquote
                                  style="border:none;border-left:solid
                                  #CCCCCC 1.0pt;padding:0in 0in 0in
6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-bottom:5.0pt">
                                  <p class="MsoNormal"
                                    style="mso-margin-top-alt:auto;margin-bottom:12.0pt;margin-left:.5in">
                                    <font face="Times New Roman"
                                      size="3"><span
                                        style="font-size:12.0pt"><br>
                                        Yes, I imagine that worst case
                                        there can be a <span
                                          class="SpellE">SRC_URI_distro</span>
                                        definition that includes only
                                        the .<span class="SpellE">scc</span>
                                        files required for that
                                        "minimal" image build, but it
                                        seems like we want to keep away
                                        from that as much as possible
                                        being that this isn't a <span
                                          class="SpellE">distro</span>
                                        layer.<o:p></o:p></span></font></p>
                                </blockquote>
                                <div>
                                  <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                                      face="Times New Roman" size="3"><span
                                        style="font-size:12.0pt">&nbsp;<o:p></o:p></span></font></p>
                                </div>
                                <div>
                                  <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                                      face="Times New Roman" size="3"><span
                                        style="font-size:12.0pt">Typically
                                        we do this via a base
                                        KERNEL_FEATURES specification in
                                        the relevant recipe(s), and<o:p></o:p></span></font></p>
                                </div>
                                <div>
                                  <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><span
                                      class="SpellE"><font face="Times
                                        New Roman" size="3"><span
                                          style="font-size:12.0pt">distros</span></font></span>,
                                    or other configurations can
                                    override/extend it as required.<o:p></o:p></p>
                                </div>
                                <div>
                                  <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                                      face="Times New Roman" size="3"><span
                                        style="font-size:12.0pt">&nbsp;<o:p></o:p></span></font></p>
                                </div>
                                <div>
                                  <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                                      face="Times New Roman" size="3"><span
                                        style="font-size:12.0pt">Cheers,<o:p></o:p></span></font></p>
                                </div>
                                <div>
                                  <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                                      face="Times New Roman" size="3"><span
                                        style="font-size:12.0pt">&nbsp;<o:p></o:p></span></font></p>
                                </div>
                                <div>
                                  <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><span
                                      class="SpellE"><font face="Times
                                        New Roman" size="3"><span
                                          style="font-size:12.0pt">Buce</span></font></span><o:p></o:p></p>
                                </div>
                                <div>
                                  <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                                      face="Times New Roman" size="3"><span
                                        style="font-size:12.0pt">&nbsp;<o:p></o:p></span></font></p>
                                </div>
                                <blockquote
                                  style="border:none;border-left:solid
                                  #CCCCCC 1.0pt;padding:0in 0in 0in
6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-bottom:5.0pt">
                                  <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                                      face="Times New Roman" size="3"><span
                                        style="font-size:12.0pt">Thanks,<br>
                                        Ray <o:p></o:p></span></font></p>
                                  <div>
                                    <div>
                                      <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                                          face="Times New Roman"
                                          size="3"><span
                                            style="font-size:12.0pt"><br>
                                            <br>
                                            On 01/07/2013 05:08 AM,
                                            Mihai Prica wrote:<o:p></o:p></span></font></p>
                                      <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                                          face="Times New Roman"
                                          size="3"><span
                                            style="font-size:12.0pt">Signed-off-by:
                                            Mihai Prica &lt;<a
                                              moz-do-not-send="true"
                                              href="mailto:mihai.prica@intel.com"
                                              target="_blank">mihai.prica@intel.com</a>&gt;<br>
                                            ---<br>
                                            &nbsp; recipes-kernel/<span
                                              class="SpellE">linux</span>/<span
                                              class="SpellE">linux-yocto</span>/<span
                                              class="SpellE">kvm-enable.scc</span>
                                            | &nbsp; &nbsp;4 ++++<br>
                                            &nbsp; recipes-kernel/<span
                                              class="SpellE">linux</span>/<span
                                              class="SpellE">linux-yocto</span>/<span
                                              class="SpellE">kvm.cfg</span>
                                            &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; &nbsp;4 ++++<br>
                                            &nbsp; recipes-kernel/<span
                                              class="SpellE">linux</span>/linux-yocto_3.4.bbappend
                                            &nbsp; | &nbsp; &nbsp;1 +<br>
                                            &nbsp; 3 files changed, 9
                                            insertions(+)<br>
                                            &nbsp; create mode 100644
                                            recipes-kernel/<span
                                              class="SpellE">linux</span>/<span
                                              class="SpellE">linux-yocto</span>/<span
                                              class="SpellE">kvm-enable.scc</span><br>
                                            &nbsp; create mode 100644
                                            recipes-kernel/<span
                                              class="SpellE">linux</span>/<span
                                              class="SpellE">linux-yocto</span>/<span
                                              class="SpellE">kvm.cfg</span><br>
                                            <br>
                                            diff --<span class="SpellE">git</span>
                                            a/recipes-kernel/<span
                                              class="SpellE">linux</span>/<span
                                              class="SpellE">linux-yocto</span>/<span
                                              class="SpellE">kvm-enable.scc</span>
                                            b/recipes-kernel/<span
                                              class="SpellE">linux</span>/<span
                                              class="SpellE">linux-yocto</span>/<span
                                              class="SpellE">kvm-enable.scc</span><br>
                                            new file mode 100644<br>
                                            index 0000000..0b5f4fc<br>
                                            --- /<span class="SpellE">dev</span>/null<br>
                                            +++ b/recipes-kernel/<span
                                              class="SpellE">linux</span>/<span
                                              class="SpellE">linux-yocto</span>/<span
                                              class="SpellE">kvm-enable.scc</span><br>
                                            @@ -0,0 +1,4 @@<br>
                                            +define KFEATURE_DESCRIPTION
                                            "Enable KVM host support"<br>
                                            +define
                                            KFEATURE_COMPATIBILITY board<br>
                                            +<br>
                                            +<span class="SpellE">kconf</span>
                                            non-hardware <span
                                              class="SpellE">kvm.cfg</span><br>
                                            diff --<span class="SpellE">git</span>
                                            a/recipes-kernel/<span
                                              class="SpellE">linux</span>/<span
                                              class="SpellE">linux-yocto</span>/<span
                                              class="SpellE">kvm.cfg</span>
                                            b/recipes-kernel/<span
                                              class="SpellE">linux</span>/<span
                                              class="SpellE">linux-yocto</span>/<span
                                              class="SpellE">kvm.cfg</span><br>
                                            new file mode 100644<br>
                                            index 0000000..0cfcf58<br>
                                            --- /<span class="SpellE">dev</span>/null<br>
                                            +++ b/recipes-kernel/<span
                                              class="SpellE">linux</span>/<span
                                              class="SpellE">linux-yocto</span>/<span
                                              class="SpellE">kvm.cfg</span><br>
                                            @@ -0,0 +1,4 @@<br>
                                            +CONFIG_KVM=y<br>
                                            +CONFIG_KVM_INTEL=y<br>
                                            +CONFIG_KVM_AMD=y<br>
                                            +CONFIG_TUN=y<br>
                                            diff --<span class="SpellE">git</span>
                                            a/recipes-kernel/<span
                                              class="SpellE">linux</span>/linux-yocto_3.4.bbappend
                                            b/recipes-kernel/<span
                                              class="SpellE">linux</span>/linux-yocto_3.4.bbappend<br>
                                            index 5b163ff..71bead2
                                            100644<br>
                                            --- a/recipes-kernel/<span
                                              class="SpellE">linux</span>/linux-yocto_3.4.bbappend<br>
                                            +++ b/recipes-kernel/<span
                                              class="SpellE">linux</span>/linux-yocto_3.4.bbappend<br>
                                            @@ -4,5 +4,6 @@ SRC_URI += "<a
                                              moz-do-not-send="true"
href="file:///%5C%5Cxt-checksum.scc%20%5C%0b%A0%20%A0%20%A0%20%A0%20%A0%20%A0%20%A0%20file:%5Cebtables.scc%20%5C%0b%A0%20%A0%20%A0%20%A0%20%A0%20%A0%20file:%5Cvswitch.scc%20%5C%0b%A0%20%A0%20%A0%20%A0%20%A0%20%A0%20file:%5Clxc.scc%20%5C%0b+%20%A0%20%A0%20%A0%20%A0%20%A0%20%A0file:%5Ckvm-enable.scc%20%5C%0b%A0%20%A0%20%A0%20%A0%20%A0%20%A0%20">file://xt-checksum.scc

                                              \<br>
                                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                              file://ebtables.scc \<br>
                                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                              file://vswitch.scc \<br>
                                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://lxc.scc
                                              \<br>
                                              + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                              &nbsp;file://kvm-enable.scc \<br>
                                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </a>"<br>
                                            &nbsp; <o:p></o:p></span></font></p>
                                      <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                                          face="Times New Roman"
                                          size="3"><span
                                            style="font-size:12.0pt">&nbsp;<o:p></o:p></span></font></p>
                                    </div>
                                  </div>
                                  <div>
                                    <div>
                                      <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                                          face="Times New Roman"
                                          size="3"><span
                                            style="font-size:12.0pt">_______________________________________________<br>
                                            meta-virtualization mailing
                                            list<br>
                                            <a moz-do-not-send="true"
                                              href="mailto:meta-virtualization@yoctoproject.org"
                                              target="_blank">meta-virtualization@yoctoproject.org</a><br>
                                            <a moz-do-not-send="true"
                                              href="https://lists.yoctoproject.org/listinfo/meta-virtualization"
                                              target="_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization</a><o:p></o:p></span></font></p>
                                    </div>
                                  </div>
                                </blockquote>
                              </div>
                              <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                                  face="Times New Roman" size="3"><span
                                    style="font-size:12.0pt"><br>
                                    <br
                                      style="mso-special-character:line-break"
                                      clear="all">
                                    <o:p></o:p></span></font></p>
                              <div>
                                <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                                    face="Times New Roman" size="3"><span
                                      style="font-size:12.0pt">&nbsp;<o:p></o:p></span></font></p>
                              </div>
                              <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                                  face="Times New Roman" size="3"><span
                                    style="font-size:12.0pt">-- <br>
                                    "Thou shalt not follow the NULL
                                    pointer, for chaos and madness await
                                    thee at its end"
                                    <o:p></o:p></span></font></p>
                            </div>
                          </div>
                          <p class="MsoNormal"
style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:.5in"><font
                              face="Times New Roman" size="3"><span
                                style="font-size:12.0pt">&nbsp;<o:p></o:p></span></font></p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </blockquote>
            </div>
            <p class="MsoNormal" style="margin-left:.5in"><font
                face="Times New Roman" size="3"><span
                  style="font-size:12.0pt"><br>
                  <br style="mso-special-character:line-break"
                    clear="all">
                  <o:p></o:p></span></font></p>
            <div>
              <p class="MsoNormal" style="margin-left:.5in"><font
                  face="Times New Roman" size="3"><span
                    style="font-size:12.0pt"><o:p>&nbsp;</o:p></span></font></p>
            </div>
            <p class="MsoNormal" style="margin-left:.5in"><font
                face="Times New Roman" size="3"><span
                  style="font-size:12.0pt">--
                  <br>
                  "Thou shalt not follow the NULL pointer, for chaos and
                  madness await thee at its end"
                  <o:p></o:p></span></font></p>
          </div>
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

--------------070408020902030900060604--
