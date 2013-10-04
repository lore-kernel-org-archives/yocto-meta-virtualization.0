Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 08175E0163D;
	Fri,  4 Oct 2013 14:02:27 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r94L2QtF004835
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 4 Oct 2013 14:02:27 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 4 Oct 2013 14:02:26 -0700
Message-ID: <524F2CDE.1010805@windriver.com>
Date: Fri, 4 Oct 2013 17:02:22 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <meta-virtualization@yoctoproject.org>, <yocto@yoctoproject.org>
Subject: [Announce]: meta-cloud-services and OpenStack integration
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
X-List-Received-Date: Fri, 04 Oct 2013 21:02:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I'd like to share some work that we've been doing at Wind River around
cloud and clustering, in particular, bringing the OpenStack Grizzly
release [https://wiki.openstack.org/wiki/ReleaseNotes/Grizzly] to the
OpenEmbedded and Yocto Project ecosystem.

All of the major OpenStack Grizzly components (and their dependencies)
are part of this integration:

   - OpenStack Networking (Quantum)
   - OpenStack Object Storage (Swift)
   - OpenStack Block Storage (Cinder)
   - OpenStack Identity (Keystone)
   - OpenStack Image Service (Glance)
   - OpenStack Dashboard (Horizon)

The following layers have been populated on git.yoctoproject.org:

   git://git.yoctoproject.org/meta-cloud-services
    |
    +- meta-openstack
    +- meta-openstack-compute-deploy
    +- meta-openstack-controller-deploy
    +- meta-openstack-qemu

The READMEs in the various layers have details on the build,
configuration and launch of the reference use case. Improvements
to the documentation are welcome, since assumptions inevitably sneak
in when you least expect it.

The reference use case mentioned above is:

   - Separate control and compute node targets
   - Ability to schedule and launch a guest on the compute node

If you have a powerful enough machine, this reference use case can
be run completely on a single host from within VMs.

Consider this a baseline that pulls together the great work being done
in oe-core, meta-oe, meta-realtime and the Yocto Project. What I've
shared works, but like everything, it needs more eyes, fixes and lots
of collaboration.

Since this is closely related to virtualization, discussions and
patch sharing will take place on meta-virtualization@yoctoproject.org.

We are all looking forward to collaborating and enhancing the
capabilities of Embedded Cloud computing through the broad range of
new platforms and applications available via the Yocto Project.

Upstream OpenStack minor releases, and major releases will be tracked
with the layers, including when the imminent OpenStack Havana release
is stabilized, the recipes will be updated and made available.

 From the Yocto Project point of view, the layers will also be branched
and tagged in coordination with its normal release milestones.

Enjoy.
Bruce

p.s. There are a few recipe updates and patches that are being carried
in this layer to keep things simple, they'll be sent out to their
appropriate homes as soon as possible.

