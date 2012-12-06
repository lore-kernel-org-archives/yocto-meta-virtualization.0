Return-Path: <ray.danks@se-eng.com>
Received: from judge.camp.se-eng.com
	(75-148-42-21-Colorado.hfc.comcastbusiness.net [75.148.42.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E0276E0141C
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 14:23:05 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id B2239138081;
	Thu,  6 Dec 2012 15:23:03 -0700 (MST)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Q32xf75jXs8D; Thu,  6 Dec 2012 15:23:00 -0700 (MST)
Received: from [172.20.102.1] (vpn01.camp.se-eng.com [172.20.102.1])
	by judge.camp.se-eng.com (Postfix) with ESMTPSA id 2148613806E;
	Thu,  6 Dec 2012 15:23:00 -0700 (MST)
Message-ID: <50C11AC2.7050300@se-eng.com>
Date: Thu, 06 Dec 2012 15:22:58 -0700
From: Raymond Danks <ray.danks@se-eng.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121028 Thunderbird/16.0.2
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
	<CADkTA4MBjGfqctC3Dwi69=O2xk6Xba5eAeNVq8=bvfUD7TqMkA@mail.gmail.com>
In-Reply-To: <CADkTA4MBjGfqctC3Dwi69=O2xk6Xba5eAeNVq8=bvfUD7TqMkA@mail.gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCHv4 00/15] meta-cloud merge, updated with review comments
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
X-List-Received-Date: Thu, 06 Dec 2012 22:23:07 -0000
Content-Type: multipart/alternative;
	boundary="------------030004090301050002060909"

--------------030004090301050002060909
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 12/06/2012 01:49 PM, Bruce Ashfield wrote:
>
>
>
> On Thu, Dec 6, 2012 at 12:06 PM, <david.c.nystrom@gmail.com 
> <mailto:david.c.nystrom@gmail.com>> wrote:
>
>     From: David Nyström <david.nystrom@enea.com
>     <mailto:david.nystrom@enea.com>>
>
>     PATCHv4 updated with review comments.
>
>     David Nyström (15):
>       Added protobuf-c criu dependency
>       Added protobuf criu dependency
>       Added CRIU recipe
>       Added netcf recipe, libvirt dependency
>       Added openbsd-netcat recipe, libvirt dependency
>       Added openflow recipe
>       Added openvswitch recipe
>       Added .gitignore file
>       Changed David Nyströms email in README
>       Added template cloud-* images
>       Added some details in README, and made the description common
>       Added kernel configuration for LxC and in kernel OpenvSwitch
>       Updated libvirt to 1.0.0, added more details to packageconfig
>       Removed old version of libvirt
>       Added LxC recipe from meta-fsl-ppc, curtesy of Matthew McClintock,
>         Stuart Yoder
>
>
> v4 looks pretty good to me, and we can continue to tweak it once it is
> in tree.
>
> Reviewed-by: Bruce Ashfield <bruce.ashfield@windriver.com 
> <mailto:bruce.ashfield@windriver.com>>

Thanks Bruce.  I concur. I haven't been as active as I'd have liked to 
with this, but it's good to get it in the tree and go from there.

Ray
>
>
>      .gitignore                                         |    6 +
>      README                                             |   13 +-
>      recipes-containers/criu/criu_git.bb <http://criu_git.bb>        
>            |   29 +++
>      .../criu/files/0001-Fixed-hardcoding.patch         |   47 ++++
>      recipes-containers/criu/files/disable_tests.patch  |   19 ++
>      recipes-containers/criu/protobuf-c_0.15.bb
>     <http://protobuf-c_0.15.bb>         |   20 ++
>      recipes-containers/criu/protobuf_2.4.1.bb
>     <http://protobuf_2.4.1.bb>          |   18 ++
>      recipes-containers/lxc/files/noldconfig.patch      |   29 +++
>      recipes-containers/lxc/lxc_0.8.0.bb <http://lxc_0.8.0.bb>        
>            |   39 +++
>      recipes-extended/images/cloud-image-compute.bb
>     <http://cloud-image-compute.bb>     |   14 +
>      recipes-extended/images/cloud-image-controller.bb
>     <http://cloud-image-controller.bb>  |   34 +++
>      recipes-extended/images/cloud-image-guest.bb
>     <http://cloud-image-guest.bb>       |   18 ++
>      .../{libvirt_0.10.2.bb <http://libvirt_0.10.2.bb> =>
>     libvirt_1.0.0.bb <http://libvirt_1.0.0.bb>}        |   69 +++--
>      recipes-kernel/linux/linux-yocto/lxc.cfg           |   22 ++
>      recipes-kernel/linux/linux-yocto/lxc.scc           |    4 +
>      recipes-kernel/linux/linux-yocto/vswitch.cfg       |    2 +
>      recipes-kernel/linux/linux-yocto/vswitch.scc       |    4 +
>      recipes-kernel/linux/linux-yocto_3.4.bbappend      |    5 +-
>      recipes-networking/netcat/openbsd-netcat_1.6.bb
>     <http://openbsd-netcat_1.6.bb>    |   29 +++
>      recipes-networking/netcf/netcf_git.bb <http://netcf_git.bb>      
>            |   25 ++
>      recipes-networking/openflow/openflow_1.0.bb
>     <http://openflow_1.0.bb>        |   24 ++
>      .../openvswitch/files/openvswitch-controller       |  274
>     ++++++++++++++++++++
>      .../openvswitch/files/openvswitch-controller-setup |   29 +++
>      .../openvswitch/files/openvswitch-example          |  102 ++++++++
>      .../openvswitch/files/openvswitch-switch           |  102 ++++++++
>      .../openvswitch/files/openvswitch-switch-setup     |    8 +
>      .../openvswitch/openvswitch_1.4.3.bb
>     <http://openvswitch_1.4.3.bb>               |   99 +++++++
>      27 files changed, 1053 insertions(+), 31 deletions(-)
>      create mode 100644 .gitignore
>      create mode 100644 recipes-containers/criu/criu_git.bb
>     <http://criu_git.bb>
>      create mode 100644
>     recipes-containers/criu/files/0001-Fixed-hardcoding.patch
>      create mode 100644 recipes-containers/criu/files/disable_tests.patch
>      create mode 100644 recipes-containers/criu/protobuf-c_0.15.bb
>     <http://protobuf-c_0.15.bb>
>      create mode 100644 recipes-containers/criu/protobuf_2.4.1.bb
>     <http://protobuf_2.4.1.bb>
>      create mode 100644 recipes-containers/lxc/files/noldconfig.patch
>      create mode 100644 recipes-containers/lxc/lxc_0.8.0.bb
>     <http://lxc_0.8.0.bb>
>      create mode 100644 recipes-extended/images/cloud-image-compute.bb
>     <http://cloud-image-compute.bb>
>      create mode 100644
>     recipes-extended/images/cloud-image-controller.bb
>     <http://cloud-image-controller.bb>
>      create mode 100644 recipes-extended/images/cloud-image-guest.bb
>     <http://cloud-image-guest.bb>
>      rename recipes-extended/libvirt/{libvirt_0.10.2.bb
>     <http://libvirt_0.10.2.bb> => libvirt_1.0.0.bb
>     <http://libvirt_1.0.0.bb>} (61%)
>      create mode 100644 recipes-kernel/linux/linux-yocto/lxc.cfg
>      create mode 100644 recipes-kernel/linux/linux-yocto/lxc.scc
>      create mode 100644 recipes-kernel/linux/linux-yocto/vswitch.cfg
>      create mode 100644 recipes-kernel/linux/linux-yocto/vswitch.scc
>      create mode 100644
>     recipes-networking/netcat/openbsd-netcat_1.6.bb
>     <http://openbsd-netcat_1.6.bb>
>      create mode 100644 recipes-networking/netcf/netcf_git.bb
>     <http://netcf_git.bb>
>      create mode 100644 recipes-networking/openflow/openflow_1.0.bb
>     <http://openflow_1.0.bb>
>      create mode 100755
>     recipes-networking/openvswitch/files/openvswitch-controller
>      create mode 100644
>     recipes-networking/openvswitch/files/openvswitch-controller-setup
>      create mode 100644
>     recipes-networking/openvswitch/files/openvswitch-example
>      create mode 100644
>     recipes-networking/openvswitch/files/openvswitch-switch
>      create mode 100644
>     recipes-networking/openvswitch/files/openvswitch-switch-setup
>      create mode 100644
>     recipes-networking/openvswitch/openvswitch_1.4.3.bb
>     <http://openvswitch_1.4.3.bb>
>
>     --
>     1.7.9.5
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
>
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization


--------------030004090301050002060909
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 12/06/2012 01:49 PM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote
cite="mid:CADkTA4MBjGfqctC3Dwi69=O2xk6Xba5eAeNVq8=bvfUD7TqMkA@mail.gmail.com"
      type="cite"><br>
      <div class="gmail_extra"><br>
        <br>
        <div class="gmail_quote">On Thu, Dec 6, 2012 at 12:06 PM, <span
            dir="ltr">&lt;<a moz-do-not-send="true"
              href="mailto:david.c.nystrom@gmail.com" target="_blank">david.c.nystrom@gmail.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">From:
            David Nystr&ouml;m &lt;<a moz-do-not-send="true"
              href="mailto:david.nystrom@enea.com">david.nystrom@enea.com</a>&gt;<br>
            <br>
            PATCHv4 updated with review comments.<br>
            <br>
            David Nystr&ouml;m (15):<br>
            &nbsp; Added protobuf-c criu dependency<br>
            &nbsp; Added protobuf criu dependency<br>
            &nbsp; Added CRIU recipe<br>
            &nbsp; Added netcf recipe, libvirt dependency<br>
            &nbsp; Added openbsd-netcat recipe, libvirt dependency<br>
            &nbsp; Added openflow recipe<br>
            &nbsp; Added openvswitch recipe<br>
            &nbsp; Added .gitignore file<br>
            &nbsp; Changed David Nystr&ouml;ms email in README<br>
            &nbsp; Added template cloud-* images<br>
            &nbsp; Added some details in README, and made the description
            common<br>
            &nbsp; Added kernel configuration for LxC and in kernel
            OpenvSwitch<br>
            &nbsp; Updated libvirt to 1.0.0, added more details to
            packageconfig<br>
            &nbsp; Removed old version of libvirt<br>
            &nbsp; Added LxC recipe from meta-fsl-ppc, curtesy of Matthew
            McClintock,<br>
            &nbsp; &nbsp; Stuart Yoder<br>
          </blockquote>
          <div><br>
          </div>
          <div>v4 looks pretty good to me, and we can continue to tweak
            it once it is</div>
          <div>in tree.</div>
          <div><br>
          </div>
          <div>Reviewed-by: Bruce Ashfield &lt;<a moz-do-not-send="true"
              href="mailto:bruce.ashfield@windriver.com">bruce.ashfield@windriver.com</a>&gt;</div>
        </div>
      </div>
    </blockquote>
    <br>
    Thanks Bruce.&nbsp; I concur. I haven't been as active as I'd have liked
    to with this, but it's good to get it in the tree and go from there.<br>
    <br>
    Ray<br>
    <blockquote
cite="mid:CADkTA4MBjGfqctC3Dwi69=O2xk6Xba5eAeNVq8=bvfUD7TqMkA@mail.gmail.com"
      type="cite">
      <div class="gmail_extra">
        <div class="gmail_quote">
          <div>&nbsp;</div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <br>
            &nbsp;.gitignore &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; &nbsp;6 +<br>
            &nbsp;README &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 13
            +-<br>
            &nbsp;recipes-containers/criu/<a moz-do-not-send="true"
              href="http://criu_git.bb" target="_blank">criu_git.bb</a>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 29 +++<br>
            &nbsp;.../criu/files/0001-Fixed-hardcoding.patch &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 47
            ++++<br>
            &nbsp;recipes-containers/criu/files/disable_tests.patch &nbsp;| &nbsp; 19
            ++<br>
            &nbsp;recipes-containers/criu/<a moz-do-not-send="true"
              href="http://protobuf-c_0.15.bb" target="_blank">protobuf-c_0.15.bb</a>
            &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 20 ++<br>
            &nbsp;recipes-containers/criu/<a moz-do-not-send="true"
              href="http://protobuf_2.4.1.bb" target="_blank">protobuf_2.4.1.bb</a>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 18 ++<br>
            &nbsp;recipes-containers/lxc/files/noldconfig.patch &nbsp; &nbsp; &nbsp;| &nbsp; 29
            +++<br>
            &nbsp;recipes-containers/lxc/<a moz-do-not-send="true"
              href="http://lxc_0.8.0.bb" target="_blank">lxc_0.8.0.bb</a>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 39 +++<br>
            &nbsp;recipes-extended/images/<a moz-do-not-send="true"
              href="http://cloud-image-compute.bb" target="_blank">cloud-image-compute.bb</a>
            &nbsp; &nbsp; | &nbsp; 14 +<br>
            &nbsp;recipes-extended/images/<a moz-do-not-send="true"
              href="http://cloud-image-controller.bb" target="_blank">cloud-image-controller.bb</a>
            &nbsp;| &nbsp; 34 +++<br>
            &nbsp;recipes-extended/images/<a moz-do-not-send="true"
              href="http://cloud-image-guest.bb" target="_blank">cloud-image-guest.bb</a>
            &nbsp; &nbsp; &nbsp; | &nbsp; 18 ++<br>
            &nbsp;.../{<a moz-do-not-send="true"
              href="http://libvirt_0.10.2.bb" target="_blank">libvirt_0.10.2.bb</a>
            =&gt; <a moz-do-not-send="true"
              href="http://libvirt_1.0.0.bb" target="_blank">libvirt_1.0.0.bb</a>}
            &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 69 +++--<br>
            &nbsp;recipes-kernel/linux/linux-yocto/lxc.cfg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 22
            ++<br>
            &nbsp;recipes-kernel/linux/linux-yocto/lxc.scc &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; &nbsp;4 +<br>
            &nbsp;recipes-kernel/linux/linux-yocto/vswitch.cfg &nbsp; &nbsp; &nbsp; | &nbsp; &nbsp;2 +<br>
            &nbsp;recipes-kernel/linux/linux-yocto/vswitch.scc &nbsp; &nbsp; &nbsp; | &nbsp; &nbsp;4 +<br>
            &nbsp;recipes-kernel/linux/linux-yocto_3.4.bbappend &nbsp; &nbsp; &nbsp;| &nbsp; &nbsp;5
            +-<br>
            &nbsp;recipes-networking/netcat/<a moz-do-not-send="true"
              href="http://openbsd-netcat_1.6.bb" target="_blank">openbsd-netcat_1.6.bb</a>
            &nbsp; &nbsp;| &nbsp; 29 +++<br>
            &nbsp;recipes-networking/netcf/<a moz-do-not-send="true"
              href="http://netcf_git.bb" target="_blank">netcf_git.bb</a>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 25 ++<br>
            &nbsp;recipes-networking/openflow/<a moz-do-not-send="true"
              href="http://openflow_1.0.bb" target="_blank">openflow_1.0.bb</a>
            &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 24 ++<br>
            &nbsp;.../openvswitch/files/openvswitch-controller &nbsp; &nbsp; &nbsp; | &nbsp;274
            ++++++++++++++++++++<br>
            &nbsp;.../openvswitch/files/openvswitch-controller-setup | &nbsp; 29
            +++<br>
            &nbsp;.../openvswitch/files/openvswitch-example &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;102
            ++++++++<br>
            &nbsp;.../openvswitch/files/openvswitch-switch &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;102
            ++++++++<br>
            &nbsp;.../openvswitch/files/openvswitch-switch-setup &nbsp; &nbsp; | &nbsp; &nbsp;8 +<br>
            &nbsp;.../openvswitch/<a moz-do-not-send="true"
              href="http://openvswitch_1.4.3.bb" target="_blank">openvswitch_1.4.3.bb</a>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 99 +++++++<br>
            &nbsp;27 files changed, 1053 insertions(+), 31 deletions(-)<br>
            &nbsp;create mode 100644 .gitignore<br>
            &nbsp;create mode 100644 recipes-containers/criu/<a
              moz-do-not-send="true" href="http://criu_git.bb"
              target="_blank">criu_git.bb</a><br>
            &nbsp;create mode 100644
            recipes-containers/criu/files/0001-Fixed-hardcoding.patch<br>
            &nbsp;create mode 100644
            recipes-containers/criu/files/disable_tests.patch<br>
            &nbsp;create mode 100644 recipes-containers/criu/<a
              moz-do-not-send="true" href="http://protobuf-c_0.15.bb"
              target="_blank">protobuf-c_0.15.bb</a><br>
            &nbsp;create mode 100644 recipes-containers/criu/<a
              moz-do-not-send="true" href="http://protobuf_2.4.1.bb"
              target="_blank">protobuf_2.4.1.bb</a><br>
            &nbsp;create mode 100644
            recipes-containers/lxc/files/noldconfig.patch<br>
            &nbsp;create mode 100644 recipes-containers/lxc/<a
              moz-do-not-send="true" href="http://lxc_0.8.0.bb"
              target="_blank">lxc_0.8.0.bb</a><br>
            &nbsp;create mode 100644 recipes-extended/images/<a
              moz-do-not-send="true"
              href="http://cloud-image-compute.bb" target="_blank">cloud-image-compute.bb</a><br>
            &nbsp;create mode 100644 recipes-extended/images/<a
              moz-do-not-send="true"
              href="http://cloud-image-controller.bb" target="_blank">cloud-image-controller.bb</a><br>
            &nbsp;create mode 100644 recipes-extended/images/<a
              moz-do-not-send="true" href="http://cloud-image-guest.bb"
              target="_blank">cloud-image-guest.bb</a><br>
            &nbsp;rename recipes-extended/libvirt/{<a moz-do-not-send="true"
              href="http://libvirt_0.10.2.bb" target="_blank">libvirt_0.10.2.bb</a>
            =&gt; <a moz-do-not-send="true"
              href="http://libvirt_1.0.0.bb" target="_blank">libvirt_1.0.0.bb</a>}
            (61%)<br>
            &nbsp;create mode 100644 recipes-kernel/linux/linux-yocto/lxc.cfg<br>
            &nbsp;create mode 100644 recipes-kernel/linux/linux-yocto/lxc.scc<br>
            &nbsp;create mode 100644
            recipes-kernel/linux/linux-yocto/vswitch.cfg<br>
            &nbsp;create mode 100644
            recipes-kernel/linux/linux-yocto/vswitch.scc<br>
            &nbsp;create mode 100644 recipes-networking/netcat/<a
              moz-do-not-send="true" href="http://openbsd-netcat_1.6.bb"
              target="_blank">openbsd-netcat_1.6.bb</a><br>
            &nbsp;create mode 100644 recipes-networking/netcf/<a
              moz-do-not-send="true" href="http://netcf_git.bb"
              target="_blank">netcf_git.bb</a><br>
            &nbsp;create mode 100644 recipes-networking/openflow/<a
              moz-do-not-send="true" href="http://openflow_1.0.bb"
              target="_blank">openflow_1.0.bb</a><br>
            &nbsp;create mode 100755
            recipes-networking/openvswitch/files/openvswitch-controller<br>
            &nbsp;create mode 100644
            recipes-networking/openvswitch/files/openvswitch-controller-setup<br>
            &nbsp;create mode 100644
            recipes-networking/openvswitch/files/openvswitch-example<br>
            &nbsp;create mode 100644
            recipes-networking/openvswitch/files/openvswitch-switch<br>
            &nbsp;create mode 100644
            recipes-networking/openvswitch/files/openvswitch-switch-setup<br>
            &nbsp;create mode 100644 recipes-networking/openvswitch/<a
              moz-do-not-send="true" href="http://openvswitch_1.4.3.bb"
              target="_blank">openvswitch_1.4.3.bb</a><br>
            <span class="HOEnZb"><font color="#888888"><br>
                --<br>
                1.7.9.5<br>
                <br>
                _______________________________________________<br>
                meta-virtualization mailing list<br>
                <a moz-do-not-send="true"
                  href="mailto:meta-virtualization@yoctoproject.org">meta-virtualization@yoctoproject.org</a><br>
                <a moz-do-not-send="true"
                  href="https://lists.yoctoproject.org/listinfo/meta-virtualization"
                  target="_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization</a><br>
              </font></span></blockquote>
        </div>
        <br>
        <br clear="all">
        <div><br>
        </div>
        -- <br>
        "Thou shalt not follow the NULL pointer, for chaos and madness
        await thee at its end"<br>
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

--------------030004090301050002060909--
