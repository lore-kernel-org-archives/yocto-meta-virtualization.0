Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 056C4E00C3A; Wed, 26 Jul 2017 06:25:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E9384E00C17
	for <meta-virtualization@yoctoproject.org>;
	Wed, 26 Jul 2017 06:25:32 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6QDPViU001576
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 26 Jul 2017 06:25:32 -0700
Received: from yow-masselst-lx1.localnet (128.224.25.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Wed, 26 Jul 2017 06:25:30 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Yi Zhao <yi.zhao@windriver.com>
Date: Wed, 26 Jul 2017 09:25:28 -0400
Message-ID: <1780815.V5NhvBOKMJ@yow-masselst-lx1>
Organization: Wind River
User-Agent: KMail/5.2.3 (Linux/4.10.0-26-generic; KDE/5.31.0; x86_64; ; )
In-Reply-To: <1501029729-15543-1-git-send-email-yi.zhao@windriver.com>
References: <1501029729-15543-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
Cc: bruce.ashfield@windriver.com, meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH V2 0/3] glusterfs: upgrade to 3.11.1
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
X-List-Received-Date: Wed, 26 Jul 2017 13:25:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, July 26, 2017 8:42:06 AM EDT Yi Zhao wrote:
> Upgrade glusterfs from 3.4.2 to 3.11.1
> Add libiverbs and librdmacm recipes which is needed by glusterfs.
> 
> Changes from V1:
> Update commit log for libibverbs as Mark's suggestion.
> 
> Yi Zhao (3):
>   libibverbs: add new recpie
>   librdmacm: add new recipe
>   glusterfs: uprev to 3.11.1

This looks good to me now. Thanks for the update.

Mark

> 
>  ...nt.glusterfs-not-accepting-version-argume.patch |  33 -----
>  ...c-allow-PYTHON-values-to-be-passed-via-en.patch |  67 ++++++++++
>  .../dependence-on-correct-header-file-path.patch   |  32 +++++
>  .../files/glusterd-change-port-range.patch         |  39 ++++++
>  .../files/{glusterd-ovp => glusterd.init}          |   6 +-
>  recipes-extended/glusterfs/files/glusterd.service  |  12 ++
>  ...fs-api-remove-unnecessary-library-options.patch |  31 +++++
>  .../glusterfs-change-default-nfs-port-number.patch |  49 +++++++
>  ...onfigure-automake-with-subdir-objects-for.patch |  37 ++++++
>  ...glusterfs-disable-default-startup-scripts.patch |  24 +++-
>  .../libglusterfs-Don-t-link-against-libfl.patch    |  46 +++++++
>  ...python-work-around-host-and-target-python.patch |  81 ++++++++++++
>  .../files/xlator-host-contamination-3.4.patch      |  34 +++--
>  recipes-extended/glusterfs/glusterfs.inc           | 142
> ++++++++++++++++----- recipes-extended/glusterfs/glusterfs_3.11.1.bb     | 
>  6 +
>  recipes-extended/glusterfs/glusterfs_3.4.2.bb      |  12 --
>  recipes-extended/libibverbs/libibverbs_1.1.7.bb    |  27 ++++
>  .../librdmacm/files/librdmacm-needs-libdl.patch    |  21 +++
>  recipes-extended/librdmacm/librdmacm_1.0.17.bb     |  41 ++++++
>  19 files changed, 639 insertions(+), 101 deletions(-)
>  delete mode 100644
> recipes-extended/glusterfs/files/0001-Fix-for-mount.glusterfs-not-accepting
> -version-argume.patch create mode 100644
> recipes-extended/glusterfs/files/configure.ac-allow-PYTHON-values-to-be-pas
> sed-via-en.patch create mode 100644
> recipes-extended/glusterfs/files/dependence-on-correct-header-file-path.pat
> ch create mode 100644
> recipes-extended/glusterfs/files/glusterd-change-port-range.patch rename
> recipes-extended/glusterfs/files/{glusterd-ovp => glusterd.init} (92%)
> create mode 100644 recipes-extended/glusterfs/files/glusterd.service create
> mode 100644
> recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-library-o
> ptions.patch create mode 100644
> recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-number.p
> atch create mode 100644
> recipes-extended/glusterfs/files/glusterfs-configure-automake-with-subdir-o
> bjects-for.patch create mode 100644
> recipes-extended/glusterfs/files/libglusterfs-Don-t-link-against-libfl.patc
> h create mode 100644
> recipes-extended/glusterfs/files/python-work-around-host-and-target-python.
> patch create mode 100644 recipes-extended/glusterfs/glusterfs_3.11.1.bb
> delete mode 100644 recipes-extended/glusterfs/glusterfs_3.4.2.bb
>  create mode 100644 recipes-extended/libibverbs/libibverbs_1.1.7.bb
>  create mode 100644
> recipes-extended/librdmacm/files/librdmacm-needs-libdl.patch create mode
> 100644 recipes-extended/librdmacm/librdmacm_1.0.17.bb



