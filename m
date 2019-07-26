Return-Path: <Mingli.Yu@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 01FC0E00C87; Fri, 26 Jul 2019 02:07:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 87AF3E0049C
	for <meta-virtualization@yoctoproject.org>;
	Fri, 26 Jul 2019 02:07:25 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6Q97NMH024168
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 Jul 2019 02:07:23 -0700 (PDT)
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 26 Jul 2019 02:07:22 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1564026221-359201-1-git-send-email-mingli.yu@windriver.com>
	<CADkTA4NTnUsV_MzAgCT-tdZ4ikr_dYcg29oDquDrUkqRfiDZ=Q@mail.gmail.com>
	<5D3A5EBF.9080200@windriver.com>
	<CADkTA4POZkdoq1OHts8a+f6Srtv2qGRZkLPHV7KNqVFJ3z0UNw@mail.gmail.com>
	<CADkTA4P7-_t63fJOzBS6odh07a3Kc+7d_hQ6grni+dEBKTULGA@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5D3AC37B.2090709@windriver.com>
Date: Fri, 26 Jul 2019 17:10:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4P7-_t63fJOzBS6odh07a3Kc+7d_hQ6grni+dEBKTULGA@mail.gmail.com>
X-Originating-IP: [128.224.162.170]
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] meta-virtualization: add layer depends on selinux
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
X-List-Received-Date: Fri, 26 Jul 2019 09:07:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年07月26日 10:38, Bruce Ashfield wrote:
>
>
> On Thu, Jul 25, 2019 at 10:31 PM Bruce Ashfield
> <bruce.ashfield@gmail.com <mailto:bruce.ashfield@gmail.com>> wrote:
>
>
>
>     On Thu, Jul 25, 2019 at 9:57 PM Yu, Mingli <mingli.yu@windriver.com
>     <mailto:mingli.yu@windriver.com>> wrote:
>
>
>
>         On 2019年07月26日 02:28, Bruce Ashfield wrote:
>          > On Wed, Jul 24, 2019 at 11:43 PM <mingli.yu@windriver.com
>         <mailto:mingli.yu@windriver.com>> wrote:
>          >>
>          >> From: Mingli Yu <Mingli.Yu@windriver.com
>         <mailto:Mingli.Yu@windriver.com>>
>          >>
>          >> Since cri-o of meta-virtualization depends on
>          >> libselinux which comes from selinux, add missing
>          >> layer depends back.
>          >
>          > This is already covered in the README. Since cri-o is optional, I
>          > didn't want it to be a hard depends.
>
>         Not matter cri-o is optional or not, but first the cri-o recipe
>         indeed
>         exists in meta-virtualization layer until now as
>         ./meta-virtualization/recipes-containers/cri-o/cri-o_git.bb
>         <http://cri-o_git.bb> and second
>         there is below logic in
>
>
>     considering that I wrote the recipe .. I know this.
>
>         ./meta-virtualization/recipes-containers/cri-o/cri-o_git.bb
>         <http://cri-o_git.bb> and clearly
>         it depends on libselinux.
>         DEPENDS = " \
>               glib-2.0 \
>               btrfs-tools \
>               gpgme \
>               ostree \
>               libdevmapper \
>               libseccomp \
>               libselinux \
>               "
>
>         So we should add the layer depends selinux(libselinux in selinux
>         layer)
>         for meta-virtualization layer, otherwise there comes below error
>         when do
>         yocto compliance check:
>         ERROR: Nothing PROVIDES 'libselinux' (but
>         /buildarea/layers/meta-virtualization/recipes-containers/cri-o/cri-o_git.bb
>         <http://cri-o_git.bb>
>         DEPENDS on or otherwise requires it)
>
>
>     My point is that I disagree with that compliance check. Unless I'm
>     building the recipe, I don't have that dependency, I want a way to
>     express that.
>
>
> That being said, I did merge the patch so the layer will be in
> compliance while I look into options for not always requiring that
> dependency.

I will send V2 patch which not hard the dependency as you said crio-u is 
optional, please ignore this patch.

Thanks,

>
> Bruce
>
>
>     Bruce
>
>         ERROR: Required build target 'meta-world-pkgdata' has no buildable
>         providers.
>
>         Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
>         'cri-o', 'libselinux'
>         ]
>
>         Thanks,
>
>          >
>          > Required for cri-o:
>          > URI: git://github.com/advancedtelematic/meta-updater
>         <http://github.com/advancedtelematic/meta-updater>
>          > URI: git://git.yoctoproject.org/meta-selinux
>         <http://git.yoctoproject.org/meta-selinux>
>          > URI: git://git.yoctoproject.org/meta-security
>         <http://git.yoctoproject.org/meta-security>
>          > branch: master
>          > revision: HEAD
>          > prio: default
>          >
>          >
>          > I haven't seen a way to do a conditional depends .. has
>         anyone else ?
>          >
>          > Bruce
>          >
>          >>
>          >> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com
>         <mailto:Mingli.Yu@windriver.com>>
>          >> ---
>          >>   conf/layer.conf | 1 +
>          >>   1 file changed, 1 insertion(+)
>          >>
>          >> diff --git a/conf/layer.conf b/conf/layer.conf
>          >> index be1f222..23efcb8 100644
>          >> --- a/conf/layer.conf
>          >> +++ b/conf/layer.conf
>          >> @@ -21,6 +21,7 @@ LAYERDEPENDS_virtualization-layer = " \
>          >>       networking-layer \
>          >>       filesystems-layer \
>          >>       meta-python \
>          >> +    selinux \
>          >>   "
>          >>
>          >>   # webserver: naigos requires apache2
>          >> --
>          >> 2.7.4
>          >>
>          >
>          >
>
>
>
>     --
>     - Thou shalt not follow the NULL pointer, for chaos and madness
>     await thee at its end
>     - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

