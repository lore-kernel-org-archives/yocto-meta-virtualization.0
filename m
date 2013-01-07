Return-Path: <ray.danks@se-eng.com>
Received: from judge.camp.se-eng.com
	(75-148-42-21-Colorado.hfc.comcastbusiness.net [75.148.42.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6A32BE01275
	for <meta-virtualization@yoctoproject.org>;
	Mon,  7 Jan 2013 10:31:39 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id 496841380F1;
	Mon,  7 Jan 2013 11:31:38 -0700 (MST)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ayTUKQKAj4T5; Mon,  7 Jan 2013 11:31:35 -0700 (MST)
Received: from [172.20.202.50] (beast.camp.se-eng.com [172.20.202.50])
	by judge.camp.se-eng.com (Postfix) with ESMTPSA id 515B91380EA;
	Mon,  7 Jan 2013 11:31:35 -0700 (MST)
Message-ID: <50EB1486.4080901@se-eng.com>
Date: Mon, 07 Jan 2013 11:31:34 -0700
From: Raymond Danks <ray.danks@se-eng.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1357560505-24122-1-git-send-email-mihai.prica@intel.com>
	<1357560505-24122-2-git-send-email-mihai.prica@intel.com>
	<50EB053F.2040809@se-eng.com>
	<CADkTA4NfJq0e-Kcg99uotS1O5ny0uQw=VVmKV0yxwwoMxqdNuw@mail.gmail.com>
In-Reply-To: <CADkTA4NfJq0e-Kcg99uotS1O5ny0uQw=VVmKV0yxwwoMxqdNuw@mail.gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/2] linux-yocto: added kernel configuration for KVM
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: ray.danks@se-eng.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 18:31:39 -0000
Content-Type: multipart/alternative;
	boundary="------------040207030102000602090408"

--------------040207030102000602090408
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2013 11:10 AM, Bruce Ashfield wrote:
>
>
>
> On Mon, Jan 7, 2013 at 12:26 PM, Raymond Danks <ray.danks@se-eng.com 
> <mailto:ray.danks@se-eng.com>> wrote:
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
>
> kernel configuration fragment use are controlled via the 
> KERNEL_FEATURES variable, and
> for anything pre-yocto 1.4 that means an in-tree kernel configuration 
> fragment (I'm still pushing
> for the fragments to be maintained in tree, since that allows them to 
> be reused and maintained
> more easily).
>
> KERNEL_FEATURES is managed like any other variable in the system, 
> including updating
> it via optional/dynamic features as we see fit.

Thanks Bruce.  Yes, KERNEL_FEATURES is what I was looking for, I 
believe.  I'm seeing some references and examples for this now.

Ray

>
>
>     Yes, I imagine that worst case there can be a SRC_URI_distro
>     definition that includes only the .scc files required for that
>     "minimal" image build, but it seems like we want to keep away from
>     that as much as possible being that this isn't a distro layer.
>
>
> Typically we do this via a base KERNEL_FEATURES specification in the 
> relevant recipe(s), and
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
>     On 01/07/2013 05:08 AM, Mihai Prica wrote:
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
>                     "
>
>
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


--------------040207030102000602090408
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 01/07/2013 11:10 AM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote
cite="mid:CADkTA4NfJq0e-Kcg99uotS1O5ny0uQw=VVmKV0yxwwoMxqdNuw@mail.gmail.com"
      type="cite">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <br>
          <div class="gmail_quote">On Mon, Jan 7, 2013 at 12:26 PM,
            Raymond Danks <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:ray.danks@se-eng.com" target="_blank">ray.danks@se-eng.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">I'm
              going to show my lack of knowledge in this area, but I
              know this is going to come up when I push a xen.cfg that I
              apparently never added.<br>
              <br>
              Is it possible to do something along the lines of
              PACKAGE_CONFIG in the linux-yocto.bbappend? &nbsp;For example,
              in the libvirt package one can use PACKAGE_CONFIG to
              construct a "minimal" build of libvirt. &nbsp;What would be the
              method for one to do the same in this package?<br>
            </blockquote>
            <div><br>
            </div>
            <div>kernel configuration fragment use are controlled via
              the KERNEL_FEATURES variable, and</div>
            <div>for anything pre-yocto 1.4 that means an in-tree kernel
              configuration fragment (I'm still pushing</div>
            <div>for the fragments to be maintained in tree, since that
              allows them to be reused and maintained</div>
            <div>more easily).</div>
            <div><br>
            </div>
            <div style="">KERNEL_FEATURES is managed like any other
              variable in the system, including updating</div>
            <div style="">it via optional/dynamic features as we see
              fit.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Thanks Bruce.&nbsp; Yes, KERNEL_FEATURES is what I was looking for, I
    believe.&nbsp; I'm seeing some references and examples for this now.<br>
    <br>
    Ray<br>
    <br>
    <blockquote
cite="mid:CADkTA4NfJq0e-Kcg99uotS1O5ny0uQw=VVmKV0yxwwoMxqdNuw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <br>
              Yes, I imagine that worst case there can be a
              SRC_URI_distro definition that includes only the .scc
              files required for that "minimal" image build, but it
              seems like we want to keep away from that as much as
              possible being that this isn't a distro layer.<br>
              <br>
            </blockquote>
            <div><br>
            </div>
            <div style="">Typically we do this via a base
              KERNEL_FEATURES specification in the relevant recipe(s),
              and</div>
            <div style="">distros, or other configurations can
              override/extend it as required.</div>
            <div style=""><br>
            </div>
            <div style="">Cheers,</div>
            <div style=""><br>
            </div>
            <div style="">Buce</div>
            <div>&nbsp;</div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              Thanks,<br>
              Ray
              <div>
                <div><br>
                  <br>
                  On 01/07/2013 05:08 AM, Mihai Prica wrote:<br>
                  <blockquote class="gmail_quote" style="margin:0 0 0
                    .8ex;border-left:1px #ccc solid;padding-left:1ex">
                    Signed-off-by: Mihai Prica &lt;<a
                      moz-do-not-send="true"
                      href="mailto:mihai.prica@intel.com"
                      target="_blank">mihai.prica@intel.com</a>&gt;<br>
                    ---<br>
                    &nbsp; recipes-kernel/linux/linux-yocto/kvm-enable.scc |
                    &nbsp; &nbsp;4 ++++<br>
                    &nbsp; recipes-kernel/linux/linux-yocto/kvm.cfg &nbsp; &nbsp; &nbsp; &nbsp;|
                    &nbsp; &nbsp;4 ++++<br>
                    &nbsp; recipes-kernel/linux/linux-yocto_3.4.bbappend &nbsp; |
                    &nbsp; &nbsp;1 +<br>
                    &nbsp; 3 files changed, 9 insertions(+)<br>
                    &nbsp; create mode 100644 recipes-kernel/linux/linux-yocto/kvm-enable.scc<br>
                    &nbsp; create mode 100644 recipes-kernel/linux/linux-yocto/kvm.cfg<br>
                    <br>
                    diff --git a/recipes-kernel/linux/linux-yocto/kvm-enable.scc
                    b/recipes-kernel/linux/linux-yocto/kvm-enable.scc<br>
                    new file mode 100644<br>
                    index 0000000..0b5f4fc<br>
                    --- /dev/null<br>
                    +++ b/recipes-kernel/linux/linux-yocto/kvm-enable.scc<br>
                    @@ -0,0 +1,4 @@<br>
                    +define KFEATURE_DESCRIPTION "Enable KVM host
                    support"<br>
                    +define KFEATURE_COMPATIBILITY board<br>
                    +<br>
                    +kconf non-hardware kvm.cfg<br>
                    diff --git a/recipes-kernel/linux/linux-yocto/kvm.cfg
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
                    diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend
                    b/recipes-kernel/linux/linux-yocto_3.4.bbappend<br>
                    index 5b163ff..71bead2 100644<br>
                    --- a/recipes-kernel/linux/linux-yocto_3.4.bbappend<br>
                    +++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend<br>
                    @@ -4,5 +4,6 @@ SRC_URI += "<a class="moz-txt-link-freetext" href="file://xt-checksum.scc">file://xt-checksum.scc</a> \<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a class="moz-txt-link-freetext" href="file://ebtables.scc">file://ebtables.scc</a> \<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a class="moz-txt-link-freetext" href="file://vswitch.scc">file://vswitch.scc</a> \<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a class="moz-txt-link-freetext" href="file://lxc.scc">file://lxc.scc</a> \<br>
                    + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class="moz-txt-link-freetext" href="file://kvm-enable.scc">file://kvm-enable.scc</a> \<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "<br>
                    &nbsp; <br>
                  </blockquote>
                  <br>
                </div>
              </div>
              <div>
                <div>
                  _______________________________________________<br>
                  meta-virtualization mailing list<br>
                  <a moz-do-not-send="true"
                    href="mailto:meta-virtualization@yoctoproject.org"
                    target="_blank">meta-virtualization@yoctoproject.org</a><br>
                  <a moz-do-not-send="true"
                    href="https://lists.yoctoproject.org/listinfo/meta-virtualization"
                    target="_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization</a><br>
                </div>
              </div>
            </blockquote>
          </div>
          <br>
          <br clear="all">
          <div><br>
          </div>
          -- <br>
          "Thou shalt not follow the NULL pointer, for chaos and madness
          await thee at its end"
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------040207030102000602090408--
