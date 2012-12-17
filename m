Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 704B2E006CB
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Dec 2012 02:07:37 -0800 (PST)
Received: from [172.16.140.28] (172.16.140.28) by smtp.enea.com (172.21.1.209)
	with Microsoft SMTP Server id 14.2.318.1;
	Mon, 17 Dec 2012 11:07:33 +0100
Message-ID: <50CEEEDF.3070707@enea.com>
Date: Mon, 17 Dec 2012 11:07:27 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Raymond Danks <ray.danks@se-eng.com>
X-Originating-IP: [172.16.140.28]
Subject: 01-use-proper-tools-for-cross-build.patch in meta-virtualization
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
X-List-Received-Date: Mon, 17 Dec 2012 10:07:37 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

c0274e47: 01-use-proper-tools-for-cross-build.patch
--
Upstream-Status: Inappropriate [embedded specific]

# We need to ensure our host tools get run during build, not the freshly
# built cross-tools (this will not work), so we introduce HOSTPYTHON and 
HOSTPGEN.
# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
--

Whats the reason to keep a separate version of this patch in 
meta-virtualization ? Since meta-virt has higher prio, I suspect the 
version we have in meta-virt is being used instead on the one in 
poky/master.

diff python/01-use-proper-tools-for-cross-build.patch 
/media/sdb5/eel/poky/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch 

122,124c122,124
< +        lib_dirs = [ os.getenv( "STAGING_LIBDIR" ) ]
< +        inc_dirs = [ os.getenv( "STAGING_INCDIR" ) ]
< +        lib_dirs += os.getenv('LIBRARY_PATH', '').split(os.pathsep)
---
 > +        lib_dirs = [ os.getenv("STAGING_LIBDIR"), 
os.getenv("STAGING_BASELIBDIR") ]
 > +        inc_dirs = [ os.getenv("STAGING_INCDIR") ]
 > +


Br,
David

