Return-Path: <mark.hatle@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7B47CE00B33; Fri, 26 Jul 2019 09:47:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 38DEFE00A96
	for <meta-virtualization@yoctoproject.org>;
	Fri, 26 Jul 2019 09:46:59 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6QGkGrI013280
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 Jul 2019 09:46:32 -0700
Received: from soho-mhatle-m.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 26 Jul 2019 09:46:18 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>, "Yu, Mingli"
	<mingli.yu@windriver.com>
References: <1564026221-359201-1-git-send-email-mingli.yu@windriver.com>
	<CADkTA4NTnUsV_MzAgCT-tdZ4ikr_dYcg29oDquDrUkqRfiDZ=Q@mail.gmail.com>
	<5D3A5EBF.9080200@windriver.com>
	<CADkTA4POZkdoq1OHts8a+f6Srtv2qGRZkLPHV7KNqVFJ3z0UNw@mail.gmail.com>
	<CADkTA4P7-_t63fJOzBS6odh07a3Kc+7d_hQ6grni+dEBKTULGA@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mark.hatle@windriver.com; prefer-encrypt=mutual; keydata=
	mQENBFYKxFgBCACt/pzutBp6p/xVKTFJjHbM3KpQKCblyot/YP+bpTr51Hrc5xDXBQhoG7TC
	aIRvRIvbhEevEQK9y04gW3JK/5lobq5ORebolcsHlYBUvpNeIPjupLQwGvz/TPtrLRNGLqDC
	rvsM6OA2XbQ2bwzxWaSQS3ImE2O2iXOZn9HhThMGeDB4Nff3fgUvXOTDIrgWOn9K2DgLL7Yc
	zkUIlFdj+Nraksd/7BSk8oH6tjeBVhFqSFvKta9QxWgdr58oPaTYaW/xNqUjlLrbJuMw/MSe
	xzuYfdfDfm6J8kRjMOnwQ0n8svJElzqAk+d83ow38gpGQ+LkjGgnf8ZFJ4rUJFADroX3ABEB
	AAG0JU1hcmsgSGF0bGUgPG1hcmsuaGF0bGVAd2luZHJpdmVyLmNvbT6JATcEEwEIACEFAlYK
	xFgCGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQfv796/r0vvlvZAf9Gs+eN320yhRW
	V/fZCsngKhmOK4v3HrTwFrkSmoD9QHQiE/5IPdNacHwIPwZx07tNBohB8xOeNqCPRYRBwGhA
	AnxKOPyd0nnm6ZhPzbA57v4x3IGRQr4QzvcBTASJq91l3Ew4lpAslyx5w1DPPqRD7G8ycDKg
	peKyDwmdkvCunVisSAQI3XIMq2y230biTO98tDPEezg+lg+yTsz9ZT33F5KNuWrpf8VL5fG/
	mt+kAv7wtsx/KTRbqhH3iFXF6eBSwMjAfTXFlkLfbM9riJGXrWEl9n2S2R3cDHNHug0lb8f4
	whK370KEO4OwRKIYW/VUBmzk5XZUE9DTlDSV8ycsrrkBDQRWCsRYAQgAwK3FuHCE+HW3YWdH
	PUjeSn5p//xJ57u8g2rng8zm9zNjmYgpPv5UxozaD9i2jf4mlQLHGGOezhHae8K4Nj70oVcv
	8AmwcrJa9i9WL1oy/9R3fHMWf/Ctt9VXTO0qlCuq6PDzaUfvsXR61aJIjTKNQTOjCLjY1vXm
	VSewUgARysmA8WrjTfwGBihMBxAX0+kIjx8nOlam0WvekMBXZ0AbS56oTLRxYao6DI3GeB/N
	oWPy/5DfuTKaSdM0Pf8al20x9RuNN5/HLMlyDH/k8bIa1xd9aAqW+Feiw5gC107V2E6ULyIy
	q6em2UrsmIRxrvpHqbNgQKqvTehJ+V/i4g/uOwARAQABiQEfBBgBCAAJBQJWCsRYAhsMAAoJ
	EH7+/ev69L755XAH/3ZcNhooqd9OBhFkvXm1iWZ8EoC7motWqVn2oEyxoonsg8AD9kFXiN+T
	dYp7dH99EZu9q4ptj56AXm4uHzOgywL/5/V2TY6twCGAjUGzDjAB5gzoi+JLIBlDiyOip0eL
	QswIhRk473xy3j8DA4oVamnSPWgyNJ+qsdt37YWDzoDFFvtDoRU7Eb+znfIMDKzlny0XU/8L
	cW1bNHJlpv/78GPdfP4tjysEd8MuA5jf5o5w4XqcwTqalffEJtQ/s3pbkstEi7qm5uPui5Kt
	gq6YYLSqcSNe0GWAF9/T+qwyo7burSTxUWCWtMmlXdAQLW9SynLhB3Jbch0nFAh0fCKi6yY=
Organization: Wind River Systems
Message-ID: <d0cbd2bb-f9c9-ae76-70b5-d8e8beaa825a@windriver.com>
Date: Fri, 26 Jul 2019 11:46:16 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4P7-_t63fJOzBS6odh07a3Kc+7d_hQ6grni+dEBKTULGA@mail.gmail.com>
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
X-List-Received-Date: Fri, 26 Jul 2019 16:47:00 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 7/25/19 9:38 PM, Bruce Ashfield wrote:
> 
> 
> On Thu, Jul 25, 2019 at 10:31 PM Bruce Ashfield <bruce.ashfield@gmail.com
> <mailto:bruce.ashfield@gmail.com>> wrote:
> 
> 
> 
>     On Thu, Jul 25, 2019 at 9:57 PM Yu, Mingli <mingli.yu@windriver.com
>     <mailto:mingli.yu@windriver.com>> wrote:
> 
> 
> 
>         On 2019年07月26日 02:28, Bruce Ashfield wrote:
>         > On Wed, Jul 24, 2019 at 11:43 PM <mingli.yu@windriver.com
>         <mailto:mingli.yu@windriver.com>> wrote:
>         >>
>         >> From: Mingli Yu <Mingli.Yu@windriver.com
>         <mailto:Mingli.Yu@windriver.com>>
>         >>
>         >> Since cri-o of meta-virtualization depends on
>         >> libselinux which comes from selinux, add missing
>         >> layer depends back.
>         >
>         > This is already covered in the README. Since cri-o is optional, I
>         > didn't want it to be a hard depends.
> 
>         Not matter cri-o is optional or not, but first the cri-o recipe indeed
>         exists in meta-virtualization layer until now as
>         ./meta-virtualization/recipes-containers/cri-o/cri-o_git.bb
>         <http://cri-o_git.bb> and second
>         there is below logic in
> 
> 
>     considering that I wrote the recipe .. I know this.
> 
>      
> 
>         ./meta-virtualization/recipes-containers/cri-o/cri-o_git.bb
>         <http://cri-o_git.bb> and clearly
>         it depends on libselinux.
>         DEPENDS = " \
>              glib-2.0 \
>              btrfs-tools \
>              gpgme \
>              ostree \
>              libdevmapper \
>              libseccomp \
>              libselinux \
>              "

Why does cri-o (any version) require libselinux?  (libseccomp I can see).

Is this something that changed upstream to make it mandatory?  If so, any way to
reverse it?  selinux is horribly heavy weight for a lot of things.

>         So we should add the layer depends selinux(libselinux in selinux layer)
>         for meta-virtualization layer, otherwise there comes below error when do
>         yocto compliance check:
>         ERROR: Nothing PROVIDES 'libselinux' (but
>         /buildarea/layers/meta-virtualization/recipes-containers/cri-o/cri-o_git.bb
>         <http://cri-o_git.bb>
>         DEPENDS on or otherwise requires it)
> 
> 
>     My point is that I disagree with that compliance check. Unless I'm building
>     the recipe, I don't have that dependency, I want a way to express that.
> 
> 
> That being said, I did merge the patch so the layer will be in compliance while
> I look into options for not always requiring that dependency.

The way to do this is make the recipe based on a dynamic dependency.

IMHO the -best- way to do this, if possible, is to split the libselinux
dependency out.  Make it buildable with it.  But either way the setup is similar.

conf/layer.conf:

BBFILES_DYNAMIC += "selinux:${LAYERDIR}/dynamic-layers/selinux/recipes*/*/*.bb \

selinux:${LAYERDIR}/dynamic-layers/selinux/recipes*/*/*.bbappend"


LAYERRECOMMENDS_<collection> = " \
          selinux \
          "


The above says that selinux is recommended for use with this (layerindex can
read this and process it.)  The BBFILES_DYNAMIC says to only bring in that path
if 'selinux' collection is available.


Then move the recipe (or break out the selinux part in a bbappend) into:

dynamic-layers/selinux/recipes-containers/cri-o/...

--Mark


> Bruce
> 
>  
> 
> 
>     Bruce
> 
>      
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
>         >
>         > Required for cri-o:
>         > URI: git://github.com/advancedtelematic/meta-updater
>         <http://github.com/advancedtelematic/meta-updater>
>         > URI: git://git.yoctoproject.org/meta-selinux
>         <http://git.yoctoproject.org/meta-selinux>
>         > URI: git://git.yoctoproject.org/meta-security
>         <http://git.yoctoproject.org/meta-security>
>         > branch: master
>         > revision: HEAD
>         > prio: default
>         >
>         >
>         > I haven't seen a way to do a conditional depends .. has anyone else ?
>         >
>         > Bruce
>         >
>         >>
>         >> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com
>         <mailto:Mingli.Yu@windriver.com>>
>         >> ---
>         >>   conf/layer.conf | 1 +
>         >>   1 file changed, 1 insertion(+)
>         >>
>         >> diff --git a/conf/layer.conf b/conf/layer.conf
>         >> index be1f222..23efcb8 100644
>         >> --- a/conf/layer.conf
>         >> +++ b/conf/layer.conf
>         >> @@ -21,6 +21,7 @@ LAYERDEPENDS_virtualization-layer = " \
>         >>       networking-layer \
>         >>       filesystems-layer \
>         >>       meta-python \
>         >> +    selinux \
>         >>   "
>         >>
>         >>   # webserver: naigos requires apache2
>         >> --
>         >> 2.7.4
>         >>
>         >
>         >
> 
> 
> 
>     -- 
>     - Thou shalt not follow the NULL pointer, for chaos and madness await thee
>     at its end
>     - "Use the force Harry" - Gandalf, Star Trek II
> 
> 
> 
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee at
> its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 


