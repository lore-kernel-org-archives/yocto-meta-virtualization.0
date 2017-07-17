Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 58CEBE00C43; Mon, 17 Jul 2017 13:04:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F2B0E00C36
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Jul 2017 13:04:18 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6HK4HE8004446
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Jul 2017 13:04:17 -0700
Received: from yow-bashfiel-d2.wrs.com (128.224.56.49) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 17 Jul 2017 13:04:17 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 17 Jul 2017 16:04:04 -0400
Message-ID: <1500321853-984-4-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.4.0.53.g8440f74
In-Reply-To: <1500321853-984-1-git-send-email-bruce.ashfield@windriver.com>
References: <1500321853-984-1-git-send-email-bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/12] runc-docker: Uprev to 1.0-rc3+
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
X-List-Received-Date: Mon, 17 Jul 2017 20:04:20 -0000
Content-Type: text/plain

From: Jason Wessel <jason.wessel@windriver.com>

Uprev to pick up latest changes in docker-runc.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 ...untime-spec-198f23f827eea397d4331d7eb048d.patch |  89 ++++++++++
 ...-Remove-Platform-as-no-longer-in-OCI-spec.patch |  75 ++++++++
 ...date-memory-specs-to-use-int64-not-uint64.patch | 194 +++++++++++++++++++++
 recipes-containers/runc/runc-docker_git.bb         |   9 +-
 recipes-containers/runc/runc.inc                   |   4 +
 5 files changed, 368 insertions(+), 3 deletions(-)
 create mode 100644 recipes-containers/runc/runc-docker/0001-Update-to-runtime-spec-198f23f827eea397d4331d7eb048d.patch
 create mode 100644 recipes-containers/runc/runc-docker/0002-Remove-Platform-as-no-longer-in-OCI-spec.patch
 create mode 100644 recipes-containers/runc/runc-docker/0003-Update-memory-specs-to-use-int64-not-uint64.patch

diff --git a/recipes-containers/runc/runc-docker/0001-Update-to-runtime-spec-198f23f827eea397d4331d7eb048d.patch b/recipes-containers/runc/runc-docker/0001-Update-to-runtime-spec-198f23f827eea397d4331d7eb048d.patch
new file mode 100644
index 000000000000..bc1e9a236e73
--- /dev/null
+++ b/recipes-containers/runc/runc-docker/0001-Update-to-runtime-spec-198f23f827eea397d4331d7eb048d.patch
@@ -0,0 +1,89 @@
+From e8ef6025a4f48620baf91737cd37eb5e6a40f48c Mon Sep 17 00:00:00 2001
+From: Justin Cormack <justin.cormack@docker.com>
+Date: Fri, 23 Jun 2017 17:14:59 -0700
+Subject: [PATCH 1/3] Update to runtime spec
+ 198f23f827eea397d4331d7eb048d9d4c7ff7bee
+
+Updates memory limits to be int64, and removes Platform from spec.
+
+Signed-off-by: Justin Cormack <justin.cormack@docker.com>
+---
+ vendor.conf                                        |  2 +-
+ .../opencontainers/runtime-spec/specs-go/config.go | 23 ++++++----------------
+ 2 files changed, 7 insertions(+), 18 deletions(-)
+
+diff --git a/vendor.conf b/vendor.conf
+index e23e7ea7..09a8a924 100644
+--- a/vendor.conf
++++ b/vendor.conf
+@@ -1,7 +1,7 @@
+ # OCI runtime-spec. When updating this, make sure you use a version tag rather
+ # than a commit ID so it's much more obvious what version of the spec we are
+ # using.
+-github.com/opencontainers/runtime-spec 239c4e44f2a612ed85f6db9c66247aa33f437e91
++github.com/opencontainers/runtime-spec 198f23f827eea397d4331d7eb048d9d4c7ff7bee
+ # Core libcontainer functionality.
+ github.com/mrunalp/fileutils ed869b029674c0e9ce4c0dfa781405c2d9946d08
+ github.com/opencontainers/selinux v1.0.0-rc1
+diff --git a/vendor/github.com/opencontainers/runtime-spec/specs-go/config.go b/vendor/github.com/opencontainers/runtime-spec/specs-go/config.go
+index 8bf8d924..68ab112e 100644
+--- a/vendor/github.com/opencontainers/runtime-spec/specs-go/config.go
++++ b/vendor/github.com/opencontainers/runtime-spec/specs-go/config.go
+@@ -6,8 +6,6 @@ import "os"
+ type Spec struct {
+ 	// Version of the Open Container Runtime Specification with which the bundle complies.
+ 	Version string `json:"ociVersion"`
+-	// Platform specifies the configuration's target platform.
+-	Platform Platform `json:"platform"`
+ 	// Process configures the container process.
+ 	Process *Process `json:"process,omitempty"`
+ 	// Root configures the container's root filesystem.
+@@ -101,15 +99,6 @@ type Root struct {
+ 	Readonly bool `json:"readonly,omitempty"`
+ }
+ 
+-// Platform specifies OS and arch information for the host system that the container
+-// is created for.
+-type Platform struct {
+-	// OS is the operating system.
+-	OS string `json:"os"`
+-	// Arch is the architecture
+-	Arch string `json:"arch"`
+-}
+-
+ // Mount specifies a mount for a container.
+ type Mount struct {
+ 	// Destination is the absolute path where the mount will be placed in the container.
+@@ -284,15 +273,15 @@ type LinuxBlockIO struct {
+ // LinuxMemory for Linux cgroup 'memory' resource management
+ type LinuxMemory struct {
+ 	// Memory limit (in bytes).
+-	Limit *uint64 `json:"limit,omitempty"`
++	Limit *int64 `json:"limit,omitempty"`
+ 	// Memory reservation or soft_limit (in bytes).
+-	Reservation *uint64 `json:"reservation,omitempty"`
++	Reservation *int64 `json:"reservation,omitempty"`
+ 	// Total memory limit (memory + swap).
+-	Swap *uint64 `json:"swap,omitempty"`
++	Swap *int64 `json:"swap,omitempty"`
+ 	// Kernel memory limit (in bytes).
+-	Kernel *uint64 `json:"kernel,omitempty"`
++	Kernel *int64 `json:"kernel,omitempty"`
+ 	// Kernel memory limit for tcp (in bytes)
+-	KernelTCP *uint64 `json:"kernelTCP,omitempty"`
++	KernelTCP *int64 `json:"kernelTCP,omitempty"`
+ 	// How aggressive the kernel will swap memory pages.
+ 	Swappiness *uint64 `json:"swappiness,omitempty"`
+ }
+@@ -486,7 +475,7 @@ type WindowsNetwork struct {
+ 	EndpointList []string `json:"endpointList,omitempty"`
+ 	// Specifies if unqualified DNS name resolution is allowed.
+ 	AllowUnqualifiedDNSQuery bool `json:"allowUnqualifiedDNSQuery,omitempty"`
+-	// Comma seperated list of DNS suffixes to use for name resolution.
++	// Comma separated list of DNS suffixes to use for name resolution.
+ 	DNSSearchList []string `json:"DNSSearchList,omitempty"`
+ 	// Name (ID) of the container that we will share with the network stack.
+ 	NetworkSharedContainerName string `json:"networkSharedContainerName,omitempty"`
+-- 
+2.11.0
+
diff --git a/recipes-containers/runc/runc-docker/0002-Remove-Platform-as-no-longer-in-OCI-spec.patch b/recipes-containers/runc/runc-docker/0002-Remove-Platform-as-no-longer-in-OCI-spec.patch
new file mode 100644
index 000000000000..6ec286a87b5f
--- /dev/null
+++ b/recipes-containers/runc/runc-docker/0002-Remove-Platform-as-no-longer-in-OCI-spec.patch
@@ -0,0 +1,75 @@
+From e1146182a8cebb5a6133a9e298a5e4acf99652e9 Mon Sep 17 00:00:00 2001
+From: Justin Cormack <justin.cormack@docker.com>
+Date: Fri, 23 Jun 2017 17:16:08 -0700
+Subject: [PATCH 2/3] Remove Platform as no longer in OCI spec
+
+This was never used, just validated, so was removed from spec.
+
+Signed-off-by: Justin Cormack <justin.cormack@docker.com>
+---
+ libcontainer/specconv/example.go |  5 -----
+ spec.go                          | 14 --------------
+ 2 files changed, 19 deletions(-)
+
+diff --git a/libcontainer/specconv/example.go b/libcontainer/specconv/example.go
+index 33134116..d6621194 100644
+--- a/libcontainer/specconv/example.go
++++ b/libcontainer/specconv/example.go
+@@ -2,7 +2,6 @@ package specconv
+ 
+ import (
+ 	"os"
+-	"runtime"
+ 	"strings"
+ 
+ 	"github.com/opencontainers/runtime-spec/specs-go"
+@@ -15,10 +14,6 @@ func sPtr(s string) *string { return &s }
+ func Example() *specs.Spec {
+ 	return &specs.Spec{
+ 		Version: specs.Version,
+-		Platform: specs.Platform{
+-			OS:   runtime.GOOS,
+-			Arch: runtime.GOARCH,
+-		},
+ 		Root: specs.Root{
+ 			Path:     "rootfs",
+ 			Readonly: true,
+diff --git a/spec.go b/spec.go
+index 92d38f57..876937d2 100644
+--- a/spec.go
++++ b/spec.go
+@@ -7,7 +7,6 @@ import (
+ 	"fmt"
+ 	"io/ioutil"
+ 	"os"
+-	"runtime"
+ 
+ 	"github.com/opencontainers/runc/libcontainer/configs"
+ 	"github.com/opencontainers/runc/libcontainer/specconv"
+@@ -131,9 +130,6 @@ func loadSpec(cPath string) (spec *specs.Spec, err error) {
+ 	if err = json.NewDecoder(cf).Decode(&spec); err != nil {
+ 		return nil, err
+ 	}
+-	if err = validatePlatform(&spec.Platform); err != nil {
+-		return nil, err
+-	}
+ 	return spec, validateProcessSpec(spec.Process)
+ }
+ 
+@@ -148,13 +144,3 @@ func createLibContainerRlimit(rlimit specs.LinuxRlimit) (configs.Rlimit, error)
+ 		Soft: rlimit.Soft,
+ 	}, nil
+ }
+-
+-func validatePlatform(platform *specs.Platform) error {
+-	if platform.OS != runtime.GOOS {
+-		return fmt.Errorf("target os %s mismatch with current os %s", platform.OS, runtime.GOOS)
+-	}
+-	if platform.Arch != runtime.GOARCH {
+-		return fmt.Errorf("target arch %s mismatch with current arch %s", platform.Arch, runtime.GOARCH)
+-	}
+-	return nil
+-}
+-- 
+2.11.0
+
diff --git a/recipes-containers/runc/runc-docker/0003-Update-memory-specs-to-use-int64-not-uint64.patch b/recipes-containers/runc/runc-docker/0003-Update-memory-specs-to-use-int64-not-uint64.patch
new file mode 100644
index 000000000000..9cb349221cfe
--- /dev/null
+++ b/recipes-containers/runc/runc-docker/0003-Update-memory-specs-to-use-int64-not-uint64.patch
@@ -0,0 +1,194 @@
+From 3d9074ead33a5c27dc20bb49457c69c6d2ae6b57 Mon Sep 17 00:00:00 2001
+From: Justin Cormack <justin.cormack@docker.com>
+Date: Fri, 23 Jun 2017 17:17:00 -0700
+Subject: [PATCH 3/3] Update memory specs to use int64 not uint64
+
+replace #1492 #1494
+fix #1422
+
+Since https://github.com/opencontainers/runtime-spec/pull/876 the memory
+specifications are now `int64`, as that better matches the visible interface where
+`-1` is a valid value. Otherwise finding the correct value was difficult as it
+was kernel dependent.
+
+Signed-off-by: Justin Cormack <justin.cormack@docker.com>
+---
+ libcontainer/cgroups/fs/memory.go    | 36 +++++++++++++++++-------------------
+ libcontainer/configs/cgroup_linux.go | 10 +++++-----
+ update.go                            | 14 +++++++-------
+ 3 files changed, 29 insertions(+), 31 deletions(-)
+
+diff --git a/libcontainer/cgroups/fs/memory.go b/libcontainer/cgroups/fs/memory.go
+index da2cc9f8..b739c631 100644
+--- a/libcontainer/cgroups/fs/memory.go
++++ b/libcontainer/cgroups/fs/memory.go
+@@ -73,14 +73,14 @@ func EnableKernelMemoryAccounting(path string) error {
+ 	// until a limit is set on the cgroup and limit cannot be set once the
+ 	// cgroup has children, or if there are already tasks in the cgroup.
+ 	for _, i := range []int64{1, -1} {
+-		if err := setKernelMemory(path, uint64(i)); err != nil {
++		if err := setKernelMemory(path, i); err != nil {
+ 			return err
+ 		}
+ 	}
+ 	return nil
+ }
+ 
+-func setKernelMemory(path string, kernelMemoryLimit uint64) error {
++func setKernelMemory(path string, kernelMemoryLimit int64) error {
+ 	if path == "" {
+ 		return fmt.Errorf("no such directory for %s", cgroupKernelMemoryLimit)
+ 	}
+@@ -88,7 +88,7 @@ func setKernelMemory(path string, kernelMemoryLimit uint64) error {
+ 		// kernel memory is not enabled on the system so we should do nothing
+ 		return nil
+ 	}
+-	if err := ioutil.WriteFile(filepath.Join(path, cgroupKernelMemoryLimit), []byte(strconv.FormatUint(kernelMemoryLimit, 10)), 0700); err != nil {
++	if err := ioutil.WriteFile(filepath.Join(path, cgroupKernelMemoryLimit), []byte(strconv.FormatInt(kernelMemoryLimit, 10)), 0700); err != nil {
+ 		// Check if the error number returned by the syscall is "EBUSY"
+ 		// The EBUSY signal is returned on attempts to write to the
+ 		// memory.kmem.limit_in_bytes file if the cgroup has children or
+@@ -106,14 +106,12 @@ func setKernelMemory(path string, kernelMemoryLimit uint64) error {
+ }
+ 
+ func setMemoryAndSwap(path string, cgroup *configs.Cgroup) error {
+-	ulimited := -1
+-
+-	// If the memory update is set to uint64(-1) we should also
+-	// set swap to uint64(-1), it means unlimited memory.
+-	if cgroup.Resources.Memory == uint64(ulimited) {
+-		// Only set swap if it's enbled in kernel
++	// If the memory update is set to -1 we should also
++	// set swap to -1, it means unlimited memory.
++	if cgroup.Resources.Memory == -1 {
++		// Only set swap if it's enabled in kernel
+ 		if cgroups.PathExists(filepath.Join(path, cgroupMemorySwapLimit)) {
+-			cgroup.Resources.MemorySwap = uint64(ulimited)
++			cgroup.Resources.MemorySwap = -1
+ 		}
+ 	}
+ 
+@@ -128,29 +126,29 @@ func setMemoryAndSwap(path string, cgroup *configs.Cgroup) error {
+ 		// When update memory limit, we should adapt the write sequence
+ 		// for memory and swap memory, so it won't fail because the new
+ 		// value and the old value don't fit kernel's validation.
+-		if cgroup.Resources.MemorySwap == uint64(ulimited) || memoryUsage.Limit < cgroup.Resources.MemorySwap {
+-			if err := writeFile(path, cgroupMemorySwapLimit, strconv.FormatUint(cgroup.Resources.MemorySwap, 10)); err != nil {
++		if cgroup.Resources.MemorySwap == -1 || memoryUsage.Limit < uint64(cgroup.Resources.MemorySwap) {
++			if err := writeFile(path, cgroupMemorySwapLimit, strconv.FormatInt(cgroup.Resources.MemorySwap, 10)); err != nil {
+ 				return err
+ 			}
+-			if err := writeFile(path, cgroupMemoryLimit, strconv.FormatUint(cgroup.Resources.Memory, 10)); err != nil {
++			if err := writeFile(path, cgroupMemoryLimit, strconv.FormatInt(cgroup.Resources.Memory, 10)); err != nil {
+ 				return err
+ 			}
+ 		} else {
+-			if err := writeFile(path, cgroupMemoryLimit, strconv.FormatUint(cgroup.Resources.Memory, 10)); err != nil {
++			if err := writeFile(path, cgroupMemoryLimit, strconv.FormatInt(cgroup.Resources.Memory, 10)); err != nil {
+ 				return err
+ 			}
+-			if err := writeFile(path, cgroupMemorySwapLimit, strconv.FormatUint(cgroup.Resources.MemorySwap, 10)); err != nil {
++			if err := writeFile(path, cgroupMemorySwapLimit, strconv.FormatInt(cgroup.Resources.MemorySwap, 10)); err != nil {
+ 				return err
+ 			}
+ 		}
+ 	} else {
+ 		if cgroup.Resources.Memory != 0 {
+-			if err := writeFile(path, cgroupMemoryLimit, strconv.FormatUint(cgroup.Resources.Memory, 10)); err != nil {
++			if err := writeFile(path, cgroupMemoryLimit, strconv.FormatInt(cgroup.Resources.Memory, 10)); err != nil {
+ 				return err
+ 			}
+ 		}
+ 		if cgroup.Resources.MemorySwap != 0 {
+-			if err := writeFile(path, cgroupMemorySwapLimit, strconv.FormatUint(cgroup.Resources.MemorySwap, 10)); err != nil {
++			if err := writeFile(path, cgroupMemorySwapLimit, strconv.FormatInt(cgroup.Resources.MemorySwap, 10)); err != nil {
+ 				return err
+ 			}
+ 		}
+@@ -171,13 +169,13 @@ func (s *MemoryGroup) Set(path string, cgroup *configs.Cgroup) error {
+ 	}
+ 
+ 	if cgroup.Resources.MemoryReservation != 0 {
+-		if err := writeFile(path, "memory.soft_limit_in_bytes", strconv.FormatUint(cgroup.Resources.MemoryReservation, 10)); err != nil {
++		if err := writeFile(path, "memory.soft_limit_in_bytes", strconv.FormatInt(cgroup.Resources.MemoryReservation, 10)); err != nil {
+ 			return err
+ 		}
+ 	}
+ 
+ 	if cgroup.Resources.KernelMemoryTCP != 0 {
+-		if err := writeFile(path, "memory.kmem.tcp.limit_in_bytes", strconv.FormatUint(cgroup.Resources.KernelMemoryTCP, 10)); err != nil {
++		if err := writeFile(path, "memory.kmem.tcp.limit_in_bytes", strconv.FormatInt(cgroup.Resources.KernelMemoryTCP, 10)); err != nil {
+ 			return err
+ 		}
+ 	}
+diff --git a/libcontainer/configs/cgroup_linux.go b/libcontainer/configs/cgroup_linux.go
+index 3e0509de..e15a662f 100644
+--- a/libcontainer/configs/cgroup_linux.go
++++ b/libcontainer/configs/cgroup_linux.go
+@@ -43,19 +43,19 @@ type Resources struct {
+ 	Devices []*Device `json:"devices"`
+ 
+ 	// Memory limit (in bytes)
+-	Memory uint64 `json:"memory"`
++	Memory int64 `json:"memory"`
+ 
+ 	// Memory reservation or soft_limit (in bytes)
+-	MemoryReservation uint64 `json:"memory_reservation"`
++	MemoryReservation int64 `json:"memory_reservation"`
+ 
+ 	// Total memory usage (memory + swap); set `-1` to enable unlimited swap
+-	MemorySwap uint64 `json:"memory_swap"`
++	MemorySwap int64 `json:"memory_swap"`
+ 
+ 	// Kernel memory limit (in bytes)
+-	KernelMemory uint64 `json:"kernel_memory"`
++	KernelMemory int64 `json:"kernel_memory"`
+ 
+ 	// Kernel memory limit for TCP use (in bytes)
+-	KernelMemoryTCP uint64 `json:"kernel_memory_tcp"`
++	KernelMemoryTCP int64 `json:"kernel_memory_tcp"`
+ 
+ 	// CPU shares (relative weight vs. other containers)
+ 	CpuShares uint64 `json:"cpu_shares"`
+diff --git a/update.go b/update.go
+index 0ea90d60..133be999 100644
+--- a/update.go
++++ b/update.go
+@@ -124,11 +124,11 @@ other options are ignored.
+ 
+ 		r := specs.LinuxResources{
+ 			Memory: &specs.LinuxMemory{
+-				Limit:       u64Ptr(0),
+-				Reservation: u64Ptr(0),
+-				Swap:        u64Ptr(0),
+-				Kernel:      u64Ptr(0),
+-				KernelTCP:   u64Ptr(0),
++				Limit:       i64Ptr(0),
++				Reservation: i64Ptr(0),
++				Swap:        i64Ptr(0),
++				Kernel:      i64Ptr(0),
++				KernelTCP:   i64Ptr(0),
+ 			},
+ 			CPU: &specs.LinuxCPU{
+ 				Shares:          u64Ptr(0),
+@@ -213,7 +213,7 @@ other options are ignored.
+ 			}
+ 			for _, pair := range []struct {
+ 				opt  string
+-				dest *uint64
++				dest *int64
+ 			}{
+ 				{"memory", r.Memory.Limit},
+ 				{"memory-swap", r.Memory.Swap},
+@@ -232,7 +232,7 @@ other options are ignored.
+ 					} else {
+ 						v = -1
+ 					}
+-					*pair.dest = uint64(v)
++					*pair.dest = v
+ 				}
+ 			}
+ 			r.Pids.Limit = int64(context.Int("pids-limit"))
+-- 
+2.11.0
+
diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
index 96d48cae51d3..194d6612f2b6 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -2,10 +2,13 @@ include runc.inc
 
 # Note: this rev is before the required protocol field, update when all components
 #       have been updated to match.
-SRCREV = "2f7393a47307a16f8cee44a37b262e8b81021e3e"
-SRC_URI = "git://github.com/docker/runc.git;nobranch=1 \
+SRCREV_runc-docker = "9d6821d1b53908e249487741eccd567249ca1d99"
+SRC_URI = "git://github.com/docker/runc.git;nobranch=1;name=runc-docker \
+           file://0001-Update-to-runtime-spec-198f23f827eea397d4331d7eb048d.patch \
+           file://0002-Remove-Platform-as-no-longer-in-OCI-spec.patch \
+           file://0003-Update-memory-specs-to-use-int64-not-uint64.patch \
           "
 
-RUNC_VERSION = "1.0.0-rc2"
+RUNC_VERSION = "1.0.0-rc3"
 PROVIDES += "virtual/runc"
 RPROVIDES_${PN} = "virtual/runc"
diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/runc.inc
index 4808547b15a8..dbc83c275e35 100644
--- a/recipes-containers/runc/runc.inc
+++ b/recipes-containers/runc/runc.inc
@@ -37,6 +37,10 @@ do_compile() {
 	export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
 	cd -
 
+	# Fix up symlink for go-cross compiler
+	rm -f ${S}/vendor/src
+	ln -sf ./ ${S}/vendor/src
+
 	# Pass the needed cflags/ldflags so that cgo
 	# can find the needed headers files and libraries
 	export CGO_ENABLED="1"
-- 
2.4.0.53.g8440f74


