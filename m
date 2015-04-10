Return-Path: <Rob.Woolley@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EADD9E009A1; Fri, 10 Apr 2015 11:32:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ADB81E00961
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Apr 2015 11:32:09 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3AIW8mt009176
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Apr 2015 11:32:08 -0700 (PDT)
Received: from [128.224.146.249] (128.224.146.249) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Fri, 10 Apr 2015 11:32:08 -0700
Message-ID: <55281727.6040703@windriver.com>
Date: Fri, 10 Apr 2015 14:32:07 -0400
From: Rob Woolley <rob.woolley@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: <meta-virtualization@yoctoproject.org>
References: <F9E85480F62349458DF67CE8BA000D8D4076D50F@DE08W1303.global.ds.honeywell.com>
	<CADkTA4NsatnZUvVxPZFap=O33LPkhTa0rLJwhE4oPSQ-07+tzw@mail.gmail.com>
In-Reply-To: <CADkTA4NsatnZUvVxPZFap=O33LPkhTa0rLJwhE4oPSQ-07+tzw@mail.gmail.com>
X-Originating-IP: [128.224.146.249]
Subject: Re: interest to integrate virt-manager?
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
X-List-Received-Date: Fri, 10 Apr 2015 18:32:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 4/10/2015 9:52 AM, Bruce Ashfield wrote:
> On Fri, Apr 10, 2015 at 8:19 AM, Gotthard, Petr
> <Petr.Gotthard@honeywell.com> wrote:
>> Hello,
>>
>>
>>
>> I managed to build virt-manager (plus virt-viewer and the virt-* scipts) for
>> Yocto, so I wonder if you would be interested to integrate the virt-manager
>> (and related bitbake recipes) into the meta-virtualization? Or is there
>> another recommended graphical manager for KVM?
> I'm definitely interested .. see below.
>
>> https://virt-manager.org/
>>
>>
>>
>> New virt-manager releases unfortunately require python-pygobject 3.0, which
>> is (seems to be) not supported in Yocto (yet). I wanted to avoid the GObject
>> Introspection (dependency on meta-gir), so I have scripts for virt-manager
>> 0.9.5 only, which is the latest GTK2 release. (It’s better than nothing.)
> :)
>
> We also have virt-manager recipes and uncompleted work here, it slammed
> into g-i-r and stopped .. needing on target compilation to finish the packaging
> of virt-manager.

Hi Petr,

I was trying something similar.  I've shared my work here:

https://github.com/rcwoolley/meta-cloud-services/commits/virt-install
https://github.com/rcwoolley/meta-virtualization/commits/virt-install

To get things to work, I had to build gobject-introspection on the 
target itself.

Let me know if you're interested in collaborating.  As Bruce said, I 
temporarily put things on hold when I realized that I couldn't get any 
further without cross-building gobject-introspection.

Here are my raw notes on building it natively on the target:

rpm -Uvh \
   gtk-doc-stub-1.1+git0+1dea266593-r0.core2_64.rpm \
   gtk-doc-stub-dev-1.1+git0+1dea266593-r0.core2_64.rpm

# Remove the Makefile.introspection from gtk-doc-stub
# This must be done before you do "make install" for gobject-introspection
# Otherwise you will miss the cflags-begin feature
# 
https://github.com/GNOME/gobject-introspection/commit/7639a440b43ea1197de96035304404b0c87db608 

rm /usr/share/gobject-introspection-1.0/Makefile.introspection

rpm -Uvh \
   bison-2.7.1-r0.core2_64.rpm \
   libcairo-script-interpreter2-1.12.18-r0.core2_64.rpm \
   libcairo-perf-utils-1.12.18-r0.core2_64.rpm \
   libcairo-dev-1.12.18-r0.core2_64.rpm \
   libpixman-1-dev-0.32.6-r0.core2_64.rpm \
   libfontconfig-dev-2.11.1-r0.core2_64.rpm \
   libfreetype-dev-2.5.4-r0.core2_64.rpm \
   libpng16-dev-1.6.16-r0.core2_64.rpm

git clone git://git.gnome.org/gobject-introspection
cd gobject-introspection
./autogen.sh
./configure --prefix=/usr
make
make install

rpm -Uvh \
   gnome-common-3.14.0-r0.all.rpm \
   libsoup-2.4-dev-2.46.0-r0.core2_64.rpm \
   libxslt-dev-1.1.28-r0.core2_64.rpm \
   libcheck-0.9.14-r0.core2_64.rpm \
   libcheck-dev-0.9.14-r0.core2_64.rpm

git clone git://git.fedorahosted.org/libosinfo.git
cd libosinfo
# set --enable-gtk-doc to --disable-gtk-doc in autogen.sh
mkdir build
cd build
../autogen.sh --prefix=/usr
make

osinfo/Makefile: the libosinfo_1_0_la_CFLAGS variable should have 
-I$(top_builddir) too; to avoid a fatal error finding osinfo_enum_types.h

PROBLEM: python-gobject doesn't provide gi.repository

rpm -Uvh python-pycairo-dev-1.10.0-r2.core2_64.rpm
Copy pygobject-2.28.3.tar.bz2
tar -jxvf pygobject-2.28.3.tar.bz2
cd pygobject
./configure --prefix=/usr
cp $(which libtool) .

git clone git://git.gnome.org/pygobject
cd pygobject
# In autogen.sh replace the automake and aclocal checks for 1.11 with 1.15
./autogen.sh --prefix=/usr
make
make install

rpm -Uvh libvirt-libvirtd-1.2.12-r1.core2_64.rpm \
   dmidecode-2.12.-r0.core2_64.rpm \
   libbsd0-0.7.0-r0.core2_64.rpm \
   netcat-openbsd-1.105-r0.core2_64.rpm

At this point I was able to run virt-install and virt-manager and 
stopped there.

Cheers,
Rob

