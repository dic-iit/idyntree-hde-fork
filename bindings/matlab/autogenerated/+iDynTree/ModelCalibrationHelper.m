classdef ModelCalibrationHelper < SwigRef
  methods
    function this = swig_this(self)
      this = iDynTreeMEX(3, self);
    end
    function self = ModelCalibrationHelper(varargin)
      if nargin==1 && strcmp(class(varargin{1}),'SwigRef')
        if ~isnull(varargin{1})
          self.swigPtr = varargin{1}.swigPtr;
        end
      else
        tmp = iDynTreeMEX(1413, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.SwigClear();
      end
    end
    function delete(self)
      if self.swigPtr
        iDynTreeMEX(1414, self);
        self.SwigClear();
      end
    end
    function varargout = loadModelFromString(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1415, self, varargin{:});
    end
    function varargout = loadModelFromFile(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1416, self, varargin{:});
    end
    function varargout = updateModelInertialParametersToString(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1417, self, varargin{:});
    end
    function varargout = updateModelInertialParametersToFile(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1418, self, varargin{:});
    end
    function varargout = model(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1419, self, varargin{:});
    end
    function varargout = sensors(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1420, self, varargin{:});
    end
    function varargout = isValid(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1421, self, varargin{:});
    end
  end
  methods(Static)
  end
end