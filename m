Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 6B82EE0141C
	for <meta-virtualization@yoctoproject.org>;
	Fri,  7 Dec 2012 06:39:02 -0800 (PST)
Received: from [172.16.140.28] (172.16.140.28) by smtp.enea.com (172.21.1.209)
	with Microsoft SMTP Server id 14.2.318.1;
	Fri, 7 Dec 2012 15:39:01 +0100
Message-ID: <50C1FF81.1050308@enea.com>
Date: Fri, 7 Dec 2012 15:38:57 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Raymond Danks <ray.danks@se-eng.com>
References: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
	<CADkTA4MBjGfqctC3Dwi69=O2xk6Xba5eAeNVq8=bvfUD7TqMkA@mail.gmail.com>
	<50C11AC2.7050300@se-eng.com>
In-Reply-To: <50C11AC2.7050300@se-eng.com>
X-Originating-IP: [172.16.140.28]
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
X-List-Received-Date: Fri, 07 Dec 2012 14:39:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable



On 12/06/2012 11:22 PM, Raymond Danks wrote:
> On 12/06/2012 01:49 PM, Bruce Ashfield wrote:
>>
>>
>>
>> On Thu, Dec 6, 2012 at 12:06 PM, <david.c.nystrom@gmail.com
>> <mailto:david.c.nystrom@gmail.com>> wrote:
>>
>>     From: David Nystr=F6m <david.nystrom@enea.com
>>     <mailto:david.nystrom@enea.com>>
>>
>>     PATCHv4 updated with review comments.
>>
>>     David Nystr=F6m (15):
>>       Added protobuf-c criu dependency
>>       Added protobuf criu dependency
>>       Added CRIU recipe
>>       Added netcf recipe, libvirt dependency
>>       Added openbsd-netcat recipe, libvirt dependency
>>       Added openflow recipe
>>       Added openvswitch recipe
>>       Added .gitignore file
>>       Changed David Nystr=F6ms email in README
>>       Added template cloud-* images
>>       Added some details in README, and made the description common
>>       Added kernel configuration for LxC and in kernel OpenvSwitch
>>       Updated libvirt to 1.0.0, added more details to packageconfig
>>       Removed old version of libvirt
>>       Added LxC recipe from meta-fsl-ppc, curtesy of Matthew McClintock,
>>         Stuart Yoder
>>
>>
>> v4 looks pretty good to me, and we can continue to tweak it once it is
>> in tree.
>>
>> Reviewed-by: Bruce Ashfield <bruce.ashfield@windriver.com
>> <mailto:bruce.ashfield@windriver.com>>
>
> Thanks Bruce.  I concur. I haven't been as active as I'd have liked to
> with this, but it's good to get it in the tree and go from there.
>
> Ray

Thanks, Merged to master,

Br,
David

>>
>>
>>      .gitignore                                         |    6 +
>>      README                                             |   13 +-
>>      recipes-containers/criu/criu_git.bb <http://criu_git.bb>
>>            |   29 +++
>>      .../criu/files/0001-Fixed-hardcoding.patch         |   47 ++++
>>      recipes-containers/criu/files/disable_tests.patch  |   19 ++
>>      recipes-containers/criu/protobuf-c_0.15.bb
>>     <http://protobuf-c_0.15.bb>         |   20 ++
>>      recipes-containers/criu/protobuf_2.4.1.bb
>>     <http://protobuf_2.4.1.bb>          |   18 ++
>>      recipes-containers/lxc/files/noldconfig.patch      |   29 +++
>>      recipes-containers/lxc/lxc_0.8.0.bb <http://lxc_0.8.0.bb>
>>            |   39 +++
>>      recipes-extended/images/cloud-image-compute.bb
>>     <http://cloud-image-compute.bb>     |   14 +
>>      recipes-extended/images/cloud-image-controller.bb
>>     <http://cloud-image-controller.bb>  |   34 +++
>>      recipes-extended/images/cloud-image-guest.bb
>>     <http://cloud-image-guest.bb>       |   18 ++
>>      .../{libvirt_0.10.2.bb <http://libvirt_0.10.2.bb> =3D>
>>     libvirt_1.0.0.bb <http://libvirt_1.0.0.bb>}        |   69 +++--
>>      recipes-kernel/linux/linux-yocto/lxc.cfg           |   22 ++
>>      recipes-kernel/linux/linux-yocto/lxc.scc           |    4 +
>>      recipes-kernel/linux/linux-yocto/vswitch.cfg       |    2 +
>>      recipes-kernel/linux/linux-yocto/vswitch.scc       |    4 +
>>      recipes-kernel/linux/linux-yocto_3.4.bbappend      |    5 +-
>>      recipes-networking/netcat/openbsd-netcat_1.6.bb
>>     <http://openbsd-netcat_1.6.bb>    |   29 +++
>>      recipes-networking/netcf/netcf_git.bb <http://netcf_git.bb>
>>            |   25 ++
>>      recipes-networking/openflow/openflow_1.0.bb
>>     <http://openflow_1.0.bb>        |   24 ++
>>      .../openvswitch/files/openvswitch-controller       |  274
>>     ++++++++++++++++++++
>>      .../openvswitch/files/openvswitch-controller-setup |   29 +++
>>      .../openvswitch/files/openvswitch-example          |  102 ++++++++
>>      .../openvswitch/files/openvswitch-switch           |  102 ++++++++
>>      .../openvswitch/files/openvswitch-switch-setup     |    8 +
>>      .../openvswitch/openvswitch_1.4.3.bb
>>     <http://openvswitch_1.4.3.bb>               |   99 +++++++
>>      27 files changed, 1053 insertions(+), 31 deletions(-)
>>      create mode 100644 .gitignore
>>      create mode 100644 recipes-containers/criu/criu_git.bb
>>     <http://criu_git.bb>
>>      create mode 100644
>>     recipes-containers/criu/files/0001-Fixed-hardcoding.patch
>>      create mode 100644 recipes-containers/criu/files/disable_tests.patc=
h
>>      create mode 100644 recipes-containers/criu/protobuf-c_0.15.bb
>>     <http://protobuf-c_0.15.bb>
>>      create mode 100644 recipes-containers/criu/protobuf_2.4.1.bb
>>     <http://protobuf_2.4.1.bb>
>>      create mode 100644 recipes-containers/lxc/files/noldconfig.patch
>>      create mode 100644 recipes-containers/lxc/lxc_0.8.0.bb
>>     <http://lxc_0.8.0.bb>
>>      create mode 100644 recipes-extended/images/cloud-image-compute.bb
>>     <http://cloud-image-compute.bb>
>>      create mode 100644
>>     recipes-extended/images/cloud-image-controller.bb
>>     <http://cloud-image-controller.bb>
>>      create mode 100644 recipes-extended/images/cloud-image-guest.bb
>>     <http://cloud-image-guest.bb>
>>      rename recipes-extended/libvirt/{libvirt_0.10.2.bb
>>     <http://libvirt_0.10.2.bb> =3D> libvirt_1.0.0.bb
>>     <http://libvirt_1.0.0.bb>} (61%)
>>      create mode 100644 recipes-kernel/linux/linux-yocto/lxc.cfg
>>      create mode 100644 recipes-kernel/linux/linux-yocto/lxc.scc
>>      create mode 100644 recipes-kernel/linux/linux-yocto/vswitch.cfg
>>      create mode 100644 recipes-kernel/linux/linux-yocto/vswitch.scc
>>      create mode 100644
>>     recipes-networking/netcat/openbsd-netcat_1.6.bb
>>     <http://openbsd-netcat_1.6.bb>
>>      create mode 100644 recipes-networking/netcf/netcf_git.bb
>>     <http://netcf_git.bb>
>>      create mode 100644 recipes-networking/openflow/openflow_1.0.bb
>>     <http://openflow_1.0.bb>
>>      create mode 100755
>>     recipes-networking/openvswitch/files/openvswitch-controller
>>      create mode 100644
>>     recipes-networking/openvswitch/files/openvswitch-controller-setup
>>      create mode 100644
>>     recipes-networking/openvswitch/files/openvswitch-example
>>      create mode 100644
>>     recipes-networking/openvswitch/files/openvswitch-switch
>>      create mode 100644
>>     recipes-networking/openvswitch/files/openvswitch-switch-setup
>>      create mode 100644
>>     recipes-networking/openvswitch/openvswitch_1.4.3.bb
>>     <http://openvswitch_1.4.3.bb>
>>
>>     --
>>     1.7.9.5
>>
>>     _______________________________________________
>>     meta-virtualization mailing list
>>     meta-virtualization@yoctoproject.org
>>     <mailto:meta-virtualization@yoctoproject.org>
>>     https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>>
>>
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

