classdef FrameFreeFloatingJacobian < iDynTree.MatrixDynSize
  methods
    function self = FrameFreeFloatingJacobian(varargin)
      self@iDynTree.MatrixDynSize(SwigRef.Null);
      if nargin==1 && strcmp(class(varargin{1}),'SwigRef')
        if ~isnull(varargin{1})
          self.swigPtr = varargin{1}.swigPtr;
        end
      else
        tmp = iDynTreeMEX(1003, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.swigPtr = [];
      end
    end
    function varargout = resize(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1004, self, varargin{:});
    end
    function varargout = isConsistent(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1005, self, varargin{:});
    end
    function delete(self)
      if self.swigPtr
        iDynTreeMEX(1006, self);
        self.swigPtr=[];
      end
    end
  end
  methods(Static)
  end
end
